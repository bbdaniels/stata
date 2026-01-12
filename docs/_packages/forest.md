---
layout: package
title: forest
tagline: Forest plots visualizing results from multiple regressions
category: Visualization
package_name: forest
github: https://github.com/bbdaniels/forest
---

## Description

`forest` visualizes results from multiple regressions on a single independent variable. The resulting "forest"-style chart shows the effect of a single "treatment" variable of interest on some set of dependent variables.

It can display:
- Raw coefficients
- Standardized effect sizes (Cohen's *d*)
- Odds ratios (from logistic regressions)

It can also make corrections to confidence intervals or significance estimates for family-wise error control using Bonferroni or Benjamini-Hochberg methods.

## Syntax

```stata
forest estimator (depvar family) [(depvar family)] [...]
    [weight] [if] [in]
    , rhs(varlist) [regopts(estimation options)]
    [or|d] [bonferroni|bh] [mde] [critical(value)]
    [sort(local|global)] [graphopts(twoway_options)]
```

## Options

### Required Inputs

| Option | Description |
|--------|-------------|
| `estimator` | The estimation command to use (e.g., `reg`, `logit`) |
| `(depvar family)` | Dependent variables grouped in families for error control |
| `rhs()` | Independent variable of interest and controls |

### Modelling Options

| Option | Description |
|--------|-------------|
| `controls()` | Control variables. Use `@` for current LHS variable name |
| `critical()` | P-value threshold for significance highlighting (default: 0.05) |
| `or` | Display odds ratios (exponentiated coefficients) |
| `d` | Display Cohen's *d* (standardized effect sizes) |
| `bonferroni` | Bonferroni correction for multiple comparisons |
| `bh` | Benjamini-Hochberg correction for multiple comparisons |
| `mde` | Show minimum detectable effects at 80% power |

### Display Options

| Option | Description |
|--------|-------------|
| `sort(local\|global)` | Sort results by effect size |
| `graphopts()` | Additional twoway graph options |

## Examples

```stata
* Load example data
sysuse auto, clear
gen check = rep78 > 3
gen check2 = 1-foreign
label val check origin

* Basic forest plot
forest reg (headroom foreign) , t(rep78)

* With standardized effect sizes (Cohen's d)
forest reg (headroom foreign) , t(rep78) d

* With Bonferroni correction
forest reg (headroom foreign) , t(rep78) b

* With Benjamini-Hochberg correction
forest reg (headroom foreign) , t(rep78) bh

* Logistic regression with odds ratios
forest logit (check2 foreign) , t(check) or
```

## Notes

`forest` currently requires that estimates follow the format returned by the standard `regress` command. That is, estimates are extracted from the first row of the `r(table)` matrix after estimation.

Both `bonferroni` and `bh` can be specified together, but they produce different adjustments:
- Bonferroni adjusts the confidence intervals
- Benjamini-Hochberg adjusts the significance markers

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
