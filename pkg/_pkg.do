// Create packages for all files

global directory "/Users/bbdaniels/GitHub/bbd-stata"

!rm "${directory}/stata.toc"

cd "${directory}/pkg"
!rm *.pkg

file close _all
file open toc using "${directory}/stata.toc" , write
	file write toc "v 0.1"  _n "d Benjamin Daniels"  _n


local adoFiles : dir `"${directory}/src/"' dirs "*"

cd "${directory}/pkg"
!rm *.zip
foreach file in `adoFiles' {
	local ado : dir `"${directory}/src/`file'/"' files "*.ado"
	local hlp : dir `"${directory}/src/`file'/"' files "*.sthlp"

	file write toc "p /pkg/`file' `file'"  _n

	file open `file' using "${directory}/pkg/`file'.pkg" , write
		file write `file' "v 0.1"  _n "d Benjamin Daniels"  _n

	local items ""
	foreach item in `ado' `hlp' {
		local items "`items' ${directory}/src/`file'/`item'"
		file write `file' "f /src/`file'/`item'" _n
	}
	file close `file'

	!zip `file'.zip `items'
}

file close toc

// All packed!
