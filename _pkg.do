// Create packages for all files

// Set directory
global directory "/Users/bbdaniels/GitHub/stata-releases"
cd "${directory}"

  // Update submodules
  !cd "${directory}"
  !git submodule foreach --recursive git pull origin main

  // Remove TOC
  !rm "${directory}/stata.toc"

  // Delete all packages and submission zips
  !rm *.pkg
  !rm *.zip

  // Start writing new TOC
  file close _all
  file open toc using "${directory}/stata.toc" , write
  	file write toc "v 0.1"  _n "d Benjamin Daniels"  _n

  // Find all adofiles in /src/
  local adoFiles : dir `"${directory}/src/"' dirs "*"

  // Write all adofiles into TOC and zip into packages
  foreach file in `adoFiles' {
  	local ado : dir `"${directory}/src/`file'/"' files "*.ado"
  	local hlp : dir `"${directory}/src/`file'/"' files "*.sthlp"

  	file write toc "p `file' `file'"  _n

  	file open `file' using "${directory}/`file'.pkg" , write
  		file write `file' "v 0.1"  _n "d Benjamin Daniels"  _n

  	local items ""
    local zip ""
  	foreach item in `ado' `hlp' {
  		local items "`items' ${directory}/src/`file'/`item'"
  		file write `file' "f /pkg/`item'" _n
      copy "${directory}/src/`file'/`item'" "${directory}/pkg/`item'" , replace
      copy "${directory}/src/`file'/`item'" "${directory}/`item'" , replace
      local zip "`zip' `item'"
  	}
  	file close `file'

  	!zip `file'.zip `zip'
    copy "${directory}/`file'.zip" "${directory}/zip/`file'.zip" , replace

    !rm `zip'
    !rm `file'.zip
  }

  // Finish writing TOC
  file close toc

// Close up repo
  !git add -A
  !git commit -m "Updated `c(current_date)' `c(current_time)'"
  !git push origin

// All packed!
