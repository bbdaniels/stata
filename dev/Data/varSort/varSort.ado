
cap prog drop varSort
prog def varSort , rclass

syntax anything

	local theBinaries ""
	local theCategoricals ""
	local theIntegers ""

	qui count
		local x = 100
		if `r(N)' < x local x = `r(N)'

	qui foreach var of varlist `anything' {
		levelsof `var' in 1/`x' , local(theLevels)

		cap confirm numeric variable `var'
		if _rc == 0 { 
			local theLabel : var label `var'
			if "`theLabel'" == "" {
				local theIntegers "`theIntegers' `var'"
				}
			else if regexm(" 0 1 ","`theLevels'") {
				local theBinaries "`theBinaries' `var'"
				}
			else {
				local theCategoricals "`theCategoricals' `var'"
				}

			}
		}

	return local theBinaries = "`theBinaries'"
	return local theCategoricals = "`theCategoricals'"
	return local theIntegers = "`theIntegers'"

end
