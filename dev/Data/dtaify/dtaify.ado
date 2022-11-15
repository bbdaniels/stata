// Quickly turn excel into dta

cap prog drop dtaify
    prog def dtaify

  syntax anything, ///
    [Labels(integer 1)] ///
    [Sheet(passthru)] [Append(string asis)] ///
    [Force] ///
    [Keep] ///


qui {

  if "`keep'" == "" preserve
  if "`append'" != "" local append "-`append'"
  clear
  import excel using `anything' , clear allstring `sheet'
  local outfile = subinstr(`"`anything'"',".xlsx","`append'.dta",.)

  foreach var of varlist * {
    local name = `var'[1]
    local label = `var'[`labels']
      local label = trim(itrim("`label'"))
    local name = lower(strtoname("`name'"))
    lab var `var' "`label'"
    cap ren `var' `name'
      if _rc != 0 {
        di as err "Name conflict in `var' with `name'!"
        if "`force'" == "" error 110
      }

  }

  drop in `labels'
  if `labels' != 1 drop in 1

  destring * , replace

  compress

}

save `outfile' , replace

end

// Good to go!
