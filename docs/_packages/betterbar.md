---
layout: package
title: betterbar
tagline: Bar graphs with standard error bars and cross-group comparisons
category: Visualization
package_name: betterbar
github: https://github.com/bbdaniels/betterbar
---

## Description

`betterbar` and `betterbarci` produce bar graphs with standard error bars and cross-group comparisons. These commands provide an easy way to visualize means across groups with proper uncertainty quantification.

## Syntax

```stata
betterbar varlist [if] [in] [weight], [options] [twoway_options]
betterbarci varlist [if] [in] [weight], [options] [twoway_options]
```

## Options

### Grouping Options

| Option | Description |
|--------|-------------|
| `by(varname)` | Top-level grouping of bars |
| `over(varname)` | Bottom-level grouping of bars |

### Graph Options

| Option | Description |
|--------|-------------|
| `n` | Add group sizes to legend |
| `ci` | Include 95% confidence intervals (or use `betterbarci`) |
| `vce(vcetype)` | Adjust CIs for any standard VCE type |
| `barlab` | Label bars with mean values |
| `barcolor(list)` | List of fill colors for bars |
| `pct` | Label bars as percentages (for binary variables) |
| `format(format)` | Format for bar labels |
| `vertical` | Produce vertical bars (default: horizontal) |

## Example

```stata
* Load data
sysuse auto.dta, clear

* Create grouping variable
xtile temp = rnormal(), n(4)
label def temp 1 "1" 2 "Two" 3 "Tres" 4 "IV"
label val temp temp

* Create some missing values
replace price = . if temp == 1

* Create bar graph with confidence intervals
betterbarci price mpg, over(foreign) n by(temp) bar format(%9.2f)
```

## Usage Notes

- Use `betterbar` for standard error bars
- Use `betterbarci` for 95% confidence intervals (equivalent to `betterbar, ci`)
- The default orientation is horizontal; use `vertical` for vertical bars
- Weights are supported for all calculations

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
