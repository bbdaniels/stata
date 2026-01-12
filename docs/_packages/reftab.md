---
layout: package
title: reftab
tagline: Summary statistics and regression results by category
category: Regression & Analysis
package_name: reftab
---

## Description

`reftab` displays and exports a matrix of summary statistics and regression results. It shows means of requested variables and estimated marginal effects of membership in various categories relative to a reference category.

## Syntax

```stata
reftab varlist [using] [if] [in],
    byvar(varname) refcat(base_value)
    [iv(varname)] [controls(varlist)]
    [logit] [cluster(clustvar)]
    [decimals()] [n] [sem]
    [xml_tab_options]
```

## Options

| Option | Description |
|--------|-------------|
| `byvar()` | Variable defining categories |
| `refcat()` | Reference category value |
| `iv()` | Variable to instrument in final panel |
| `controls()` | Control variables for adjusted estimates |
| `logit` | Calculate differences as odds ratios |
| `cluster()` | Cluster variable for standard errors |
| `decimals()` | Decimal places per variable |
| `n` | Add sample sizes to means panel |
| `sem` | Add standard errors of means |

## Output Structure

1. **Means panel**: Group means with optional SEs
2. **Regression panels**: Coefficients for each category relative to reference
3. **Adjusted panels** (if controls specified): Controlled estimates
4. **IV panel** (if iv specified): Instrumented estimates

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
