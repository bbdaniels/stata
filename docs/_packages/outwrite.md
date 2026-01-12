---
layout: package
title: outwrite
tagline: Export regression results to Excel, CSV, or LaTeX
category: Regression & Analysis
package_name: outwrite
github: https://github.com/bbdaniels/outwrite
---

## Description

`outwrite` reads multiple regressions saved with `estimates store`, consolidates them into a single table, and exports the results to Excel (.xlsx, .xls), CSV, or LaTeX (.tex) files.

As a programming command, it can also accept a single matrix and export it directly. It will look for a corresponding `matrix_STARS` matrix to affix significance stars to each cell.

## Syntax

```stata
outwrite estimates_1 estimates_2 [...]
    using "/path/to/output.[xlsx|xls|csv|tex]" ,
    [replace stats() drop(varlist)]
    [tstat|pvalue] [format(format)]
    [sheet(sheetname [,replace]) modify]
    [rownames("list" "of" "names") colnames("list" "of" "names")]
```

## Options

| Option | Description |
|--------|-------------|
| `replace` | Overwrite the output file if it exists |
| `stats()` | Add statistics from `e()` at the bottom (e.g., N, r2) |
| `drop(varlist)` | Suppress reporting of specified variables |
| `tstat` | Report t-statistics instead of standard errors |
| `pvalue` | Report p-values instead of standard errors |
| `format(format)` | Format table values (default: %9.2f) |
| `sheet()` | Place results in a target sheet (.xlsx only) |
| `modify` | Modify existing file (use with `sheet()`) |
| `rownames()` | Manually rename rows |
| `colnames()` | Manually rename columns |

## Example

```stata
* Load data and run regressions
sysuse auto.dta, clear
reg price i.foreign##c.mpg
est sto reg1

reg price i.foreign##c.mpg##i.rep78
est sto reg2
estadd scalar h = 4

reg price i.rep78
est sto reg3
estadd scalar h = 2.5

* Export to Excel
outwrite reg1 reg2 reg3 using "test.xlsx" ///
    , stats(N r2 h) replace ///
    col("TEST" "(2)") drop(i.rep78) format(%9.3f)
```

## Output Formats

- **Excel (.xlsx, .xls)**: Full formatting support with sheet options
- **CSV (.csv)**: Plain text, importable anywhere
- **LaTeX (.tex)**: Publication-ready table code

## Acknowledgments

While the concept of `outwrite` is original, core functionality was borrowed from `xml_tab` by Zurab Sajaia and Michael Lokshin. Many ideas came from programs such as `estout` (Ben Jann), `outreg` (John Luke Gallup), `outreg2` (Roy Wada), and others.

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
