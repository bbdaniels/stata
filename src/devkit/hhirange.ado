// Calculate all HHI values at various choices of variables

cap prog drop hhirange
prog def hhirange

syntax anything
local nvars : word count `anything'
tokenize `anything'
tempfile all

// Get all the lists of variable combinations --------------------------
preserve
qui {
  clear
  save `all' , emptyok
  set obs `nvars'
    gen n = _n
  tempfile v
    save `v' , emptyok

  forv i = 1/`nvars' {
    ren n n`i'
    cross using `v'
  }

  drop n
  duplicates drop
  tostring * , replace
    forv i = 1/`nvars' {
      replace n`i' = n`i' + "-"
    }

    egen list = concat(*)

  forv i = 1/`nvars' {
    replace list = subinstr(list,"`i'-","``i'' ",.)
  }

  forv i = 1/`c(N)' {
    local list = list[`i']
    local newlist : list uniq list
    local newlist : list sort newlist
    replace list = "`newlist'" in `i'
  }

  keep list
  sort list
  duplicates drop

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
  egen total = sum(`n')
  gen share2 = (`n'/total)^2
  collapse (mean) hhi = share2
  gen list = "`list'"
  gen n = `: word count `list''
  append using `all'
    save `all' , replace
  restore
}

preserve
use `all' , clear
graph box hhi, over(n) yscale(log)

end

// End
