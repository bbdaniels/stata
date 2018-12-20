// Create packages for all files

global directory "/Users/bbdaniels/GitHub/bbd-stata/"

local adoFiles : dir `"${directory}/src/"' dirs "*"

cd "${directory}/pkg"
!rm *.zip
foreach file in `adoFiles' {
	local ado : dir `"${directory}/src/`file'/"' files "*.ado"
	local hlp : dir `"${directory}/src/`file'/"' files "*.sthlp"

	local items ""
	foreach item in `ado' `hlp' {
		local items "`items' ${directory}/src/`file'/`item'"
	}

	!zip `file'.zip `items'
}

// All packed!
