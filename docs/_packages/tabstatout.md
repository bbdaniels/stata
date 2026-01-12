---
layout: package
title: tabstatout
tagline: Summary statistics tables with export
category: Summary Statistics & Tables
package_name: tabstatout
---

## Description

`tabstatout` produces summary statistics tables and can export to spreadsheets if `xml_tab` is installed.

## Syntax

```stata
tabstatout statlist [using] [if] [in] [weight],
    by(varname)
    [n] [sd] [total] [transpose]
    [decimals()] [xml_tab_options]
```

## Options

| Option | Description |
|--------|-------------|
| `by(varname)` | Grouping variable |
| `n` | Attach count row |
| `sd` | Add standard deviations under statistics |
| `total` | Attach summary column |
| `transpose` | Transpose the table |
| `decimals()` | Decimal places per statistic (add 'x' to suppress SEs) |

## Example

```stata
tabstatout (mean) price mpg (median) weight using "stats.xlsx", ///
    by(foreign) n sd total decimals(2 2 0)
```

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
