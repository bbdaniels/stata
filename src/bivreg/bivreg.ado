// Produces formatted Bivariate regression tables.

cap prog drop bivreg
prog def bivreg , eclass

syntax anything [if] [in], * [Controls(string asis)] [Listwise]

  marksample touse
  local varlist `anything'

  if "`listwise'" != "" {
    qui reg `depvar' `varlist' `controls' if `touse' , nocons
    qui replace `touse' = 0 if !e(sample)
    local N = r(N)
  }

  tempname mb
  tempname mv

  cap mat drop `mb' `mv'

  local depvar : word 1 of `varlist'
  local varlist = subinstr("`varlist'","`depvar'","",1)

  local v : word count `varlist'
  mat `mv' = J(`v',`v',0)
  local x = 0
  qui foreach var in `varlist' {
    local ++x
    reg `depvar' `var' `controls' if `touse' , `options'
    mat `mb' = nullmat(`mb') , _b[`var']
    mat `mv'[`x',`x'] =  e(V)[1,1]
  }

  mat colnames `mb' = `varlist'
  mat colnames `mv' = `varlist'
  mat rownames `mv' = `varlist'
  ereturn clear

  qui reg `depvar' `varlist' if `touse' , nocons
  ereturn repost b = `mb' V = `mv' , rename
  ereturn scalar r2 = .
  ereturn scalar r2_a = .
  if "`listwise'" == "" ereturn scalar N = .
    else ereturn scalar N = `N'

end

// End
