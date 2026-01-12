---
layout: package
title: sumstats
tagline: Summary statistics tables with conditional restrictions
category: Summary Statistics & Tables
package_name: sumstats
github: https://github.com/bbdaniels/sumstats
---

## Description

`sumstats` generates tables of summary statistics with various `if`-restrictions and exports them to Excel using `putexcel`. It allows you to create complex summary statistics tables with different variable sets and conditions in a single command.

## Syntax

```stata
sumstats (varlist_1 [if]) [(varlist_2 [if])] [...]
    using "/path/to/output.xlsx" [weight]
    , stats(stats_list)
    [replace] [sheet(sheetname [, replace])]
```

## Options

| Option | Description |
|--------|-------------|
| `stats()` | Statistics to calculate (uses `tabstat` syntax) |
| `replace` | Replace the output file if it exists |
| `sheet()` | Specify sheet name using `putexcel` syntax |

## Supported Statistics

Any statistic supported by `tabstat`:
- `mean` - Arithmetic mean
- `sd` - Standard deviation
- `min` / `max` - Minimum / Maximum
- `p25` / `p50` / `p75` - Percentiles
- `count` / `n` - Number of observations
- And more...

## Example

```stata
* Load data
sysuse auto.dta, clear

* Create summary statistics with different conditions
sumstats ///
    (price mpg if foreign == 0) ///
    (price displacement length if foreign == 1) ///
    using "summary_stats.xlsx" , replace stats(mean sd)
```

This creates a table showing:
- Mean and SD of price and mpg for domestic cars
- Mean and SD of price, displacement, and length for foreign cars

## Usage Notes

- Each parenthesized group can have its own variable list and `if` condition
- `aweights` and `fweights` are supported
- Statistics are calculated using `tabstat`
- Output is formatted using `putexcel`

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
