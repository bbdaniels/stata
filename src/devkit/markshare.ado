// Calculate all HHI values at various choices of variables

cap prog drop markshare
prog def markshare , rclass

syntax anything [if] [in] , [*] [tab] [cutoff(real 0.05)]
unab anything : `anything'
local nvars : word count `anything'
tokenize `anything'
tempfile all
marksample touse

// Implement tabulations ----------------------------------------------------

  tempvar generate
  qui gen `generate' = ""

  qui foreach var of varlist `anything' {
  	local label : var label `var'
  	replace `generate' = `generate' + "`comma'`label'" if `var' == 1
  	local comma " + "
  	}

  qui replace `generate' = trim(`generate')
  qui replace `generate' = regexr(`generate',"^\+","")
  qui replace `generate' = `generate' + " (Only)" if !strpos(`generate'," + ")
  qui replace `generate' = "None of These" if `generate' == " (Only)"

  if "`tab'" != "" ta `generate' if `touse', plot sort

// Graph frequencies
tempfile a b c d e

local x = 0
foreach var of varlist `anything' {
  local ++x
  local label : var label `var'
  local labels `"`labels' `x' "`label'" "'
}
qui graph hbar `anything' ///
  , asc yvar(relabel(`labels') sort(1) descending) ///
    bar(1 , fc(black) lc(none)) ///
    ylab(0 "0%" .25 "25%" .5 "50%" .75 "75%" 1 "100%" , notick)  saving(`a') nodraw ///
    note("Market Share of Each Component {&rarr}" , pos(11)) scale(0.7)

// Get all the lists of variable combinations --------------------------
preserve
qui {
  // Setup
  clear
  save `all' , emptyok
  set obs `nvars'
    gen n = _n
  tempfile v
    save `v'
    clear

  // Find all combinations
  forv i = 1/`nvars' {
    cross using `v'

    tostring * , replace

    forv j = 1/`nvars' {
      replace n = " " + n + " "
      replace n = subinstr(n," `j' ","``j'' ",.)
    }

    cap egen list = concat(*)
    if _rc != 0 replace list = list + n

    forv i = 1/`c(N)' {
      local list = list[`i']
      local newlist : list uniq list
      local newlist : list sort newlist
      replace list = "`newlist'" in `i'
    }

    keep list
    append using `all'
      duplicates drop
    save `all' , replace
  }

  // Pass information to plotting segment
  local N = `c(N)'
  forv i = 1/`c(N)' {
    local list = list[`i']
    local theLists = `"`theLists' "`list'""'
  }

restore
}

// Get all the HHIs of variable combinations --------------------------

tempname group n

qui forv i = 1/`N' {
  local list : word `i' of `theLists'
  preserve
  egen `group' = group(`list')

  gen `n' = 1
  collapse (sum) `n' , by(`group')
    drop if `group' == .

  egen total = sum(`n')
  gen share2 = (`n'/total)^2
  collapse (sum) hhi = share2
  gen list = "`list'"
  gen n = `: word count `list''

  append using `all'
    save `all' , replace
  restore
}

// Plot statistics ----------------------------------------------------

qui {
preserve
use `all' , clear

graph box hhi, over(n) yscale(log) `options' saving(`b') fxsize(60) ///
  yscale(alt) box(1 , fc(none) lc(black)) medtype(marker)  nodraw ///
  ytit("Herfindahl–Hirschman Index (HHI)") noout note("Number of Components Included {&rarr}" , pos(11)) ///
  ylab(0.125 "125" 0.25 "250" 0.5 "500" 1 "1000") yscale(r(0.125)) scale(0.7) legend(off)

graph combine "`a'" "`b'" , ycom saving(`c') nodraw  fysize(40)
restore

tempvar list n one
tempfile groups
preserve
  gen `n' = 1
  collapse (sum) `n' , by(`anything') fast
    gsort -`n'
    gen `list' = _n
    save `groups' , replace
restore
  merge m:1 `anything' using `groups' , nogen

  gen `one' = 1
  graph hbar (sum) `one' , xoverhang scale(0.7) nodraw ///
    over(`list') yvar(sort(1) descending) saving(`e') ytit("") ///
    per asy stack yscale(noline) note("Market Composition {&rarr}" , pos(11)) fysize(20)

  replace `n' = `n' / `c(N)'
  replace `list' = 0 if `n' < `cutoff'
    replace `generate' = "All Other Combinations" if `list' == 0

  graph hbar if `list' != . , xoverhang ///
    yvar(sort(1) descending) bar(1, fc(black) lc(none)) ///
    over(`generate' , sort(1)) saving(`d')  ytit("") ///
    note("Market Share of Each Strategy with Share > `cutoff' {&rarr}" , pos(11)) asc scale(0.7) ///
    ylab(0 "0%" 25 "25%" 50 "50%" 75 "75%" 100 "100%" , notick) fysize(40) nodraw

  graph combine "`c'" "`e'" "`d'" , c(1) imargins(zero)
}

end

// End
