---
layout: package
title: bstrappoly
tagline: Bootstrapped confidence intervals for local polynomial regression
category: Visualization
package_name: bstrappoly
---

## Description

`bstrappoly` generates a bootstrapped 95% confidence interval for local polynomial regression (`tw lpoly`). It can combine the confidence band with other two-way plots and an underlying histogram.

## Syntax

```stata
bstrappoly [other_plots] [if] [in],
    bootstrap(yvar xvar)
    [seed(integer)] [reps(integer)]
    [boptions(bootstrap_options)]
    [lpolyoptions(tw_line_options)]
    [cioptions(tw_rarea_options)]
    [histogram(varname)] [hoptions(histogram_options)]
    [twoway_options]
```

## Options

| Option | Description |
|--------|-------------|
| `bootstrap(y x)` | Variables for local polynomial regression |
| `seed()` | Random seed for reproducibility |
| `reps()` | Number of bootstrap replications |
| `boptions()` | Options passed to bootstrap |
| `lpolyoptions()` | Options for lpoly line |
| `cioptions()` | Options for CI area |
| `histogram()` | Add histogram of specified variable |
| `hoptions()` | Histogram formatting options |

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
