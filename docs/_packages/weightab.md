---
layout: package
title: weightab
tagline: Weighted cross-group comparison tables
category: Summary Statistics & Tables
package_name: weightab
---

## Description

`weightab` produces Excel tables and/or bar graphs with weighted cross-group comparisons. Calculations are based on `svy: mean` using supplied weights.

## Syntax

```stata
weightab varlist [if] [in] [using] [weight],
    over(varlist) [options]
```

## Options

### Primary Options

| Option | Description |
|--------|-------------|
| `over(varlist)` | Grouping variables (values should be labeled) |
| `weight` | Weight variable (pweights only) |

### XLSX Options

| Option | Description |
|--------|-------------|
| `using` | Export to specified spreadsheet |
| `stats()` | Statistics to report: b, se, t, pvalue, ll, ul, df, crit |

### Graph Options

| Option | Description |
|--------|-------------|
| `graph` | Request bar graph |
| `se` | Show 95% CIs around estimates |
| `dropzero` | Exclude bars with b=0 |
| `barlook()` | Bar styling options |

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
