// Implement "leave-N-out" analysis from Young

cap prog drop youngknife
prog def youngknife

version 13.1
syntax anything , [*] [CLuster(string asis)] [N(integer 2)] Results(string asis)

// Setup clusters

  if "`cluster'" == "" {
    tempvar uid
    gen `uid' = _n
    local cluster `uid'
  }

  tempvar clgroups
  egen `clgroups' = group(`cluster')
  local clopt vce(cluster `clgroups')

  qui levelsof `clgroups' , local(clusters)

// Setup drop combinations

  preserve

  // Fill combinations
    keep `clgroups'
    duplicates drop
    forvalues i = 1/`n' {
      gen temp_`i' = `clgroups'
      local tempvars "`tempvars' temp_`i'"
    }
    drop `clgroups'
    qui fillin temp_*

  // Clean lower triangle
    tokenize `tempvars'
    gen exList = ""
    while "`1'" != "" {
      cap drop if `1' >= `2'
      replace exList = exList + "," + string(`1')
      mac shift
    }

   // Get lists
    qui count
    local N = `r(N)'
    forvalues i = 1/`N' {
      local x`i' = exList[`i']
    }

  // Restore
  restore

// Full regression set

  cap mat drop results
  forvalues i = 1/`N' {
    qui `anything' ///
      if !inlist(`clgroups'`x`i'') ///
      , `opts' `clopt'
    mat results = nullmat(results) ///
      \ [`results'`x`i'']
  }

// Base regression

  `anything' , `opts' `clopt'
  local true = `results'
    local ttext = round(`true',0.01)

// Plot

  preserve

  clear
  svmat results

  rename results1 result
  gsort - result
  egen check = concat(results?) , punct(", ")

  local max = result in 1
    local maxtext = round(`max',0.01)
  local min = result in `N'
    local mintext = round(`min',0.01)

  kdensity result , ///
    xline(`true' `min' `max') xtit("") ///
    xlab(`true' `" "↑" "β" "`ttext'" "' `min' `" "Min" "`maxtext'"  "' `max' `" "Max" "`mintext'" "' 0 "Zero" )

// End
end

// Demo

  set matsize 5000
  sysuse census.dta, clear
  keep in 1/15
  expand 2
  youngknife reg pop death, cl(region) r(_b[death])

// Have a lovely day!
