// Calculate all HHI values at various choices of variables

cap prog drop hhirange
prog def hhirange

syntax anything , [*] [tab] [gen(string asis)]
local nvars : word count `anything'
tokenize `anything'
tempfile all

// Implement tabulations ----------------------------------------------------

  tempvar generate
  gen `generate' = ""

  qui foreach var of varlist `anything' {
  	local label : var label `var'
  	replace `generate' = `generate' + "`comma'`label'" if `var' == 1
  	local comma ", "
  	}

  qui replace `generate' = regexr(`generate',"^,","")
  qui replace `generate' = "None" if `generate' == ""

  if "`tab'" != "" ta `generate' , plot sort
  if "`gen'" != "" gen `gen' = `generate'

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

tempfile a b c d

tw scatter hhi n if n == 1 ///
  , mlab(list) mlabc(black) m(none) mlabpos(0) yscale(log) saving(`a') ///
    xtit("") xlab(1 "Components" , notick) fxsize(30) ///
    ytit("Herfindahl–Hirschman Index (HHI)") nodraw

graph box hhi, over(n) yscale(log) `options' saving(`b') fxsize(60) ///
  yscale(alt) box(1 , fc(none) lc(black)) medtype(marker) marker(1,mlab(hhi)) nodraw ///
  ytit("Herfindahl–Hirschman Index (HHI)")

graph combine "`a'" "`b'" , ycom saving(`c') nodraw

restore
tempvar list
egen `list' = group(`anything')
  drop if `list' == .
   graph hbar (sum) n , xoverhang ///
     over(`list') saving(`d') nodraw ytit(" ") ///
     per asy stack pcycle(2) yscale(noline) ytit("Share of Market")
   graph combine "`c'" "`d'" , c(1)
}

end

// End
