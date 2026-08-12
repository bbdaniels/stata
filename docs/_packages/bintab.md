---
layout: package
title: bintab
tagline: Binary proportions and population estimates
category: Summary Statistics & Tables
package_name: bintab
---

## Description

`bintab` produces Excel tables of weighted binary proportions and population estimates across categorical groups. Binary variables are reported as counts (n/N) with weighted means and 95% confidence intervals; continuous variables are reported as weighted means with 95% confidence intervals. Calculations are based on `svy: mean` using supplied weights.

## Syntax

```stata
bintab varlist [if] [in] [using] [weight],
    over(varname) [options]
```

## Options

### Primary Options

| Option | Description |
|--------|-------------|
| `over(varname)` | Grouping variable (values should be labeled) |
| `weight` | Weight variable (pweights only) |

### Additional Options

| Option | Description |
|--------|-------------|
| `using` | Export to specified spreadsheet |
| `continuous(varlist)` | Continuous variables to report as weighted means with 95% CIs |
| `svyset_opts(string)` | Options passed through to `svyset` |

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
