---
layout: package
title: rctreg
tagline: RCT regression tables with treatment/control means
category: Regression & Analysis
package_name: rctreg
---

## Description

`rctreg` performs regressions for randomized controlled trials, producing tables that show treatment and control means alongside intent-to-treat (ITT) regression estimates. It supports contamination-adjusted IV estimates and exports results to Excel.

## Syntax

```stata
rctreg varlist using [if] [in],
    treatment(varlist) controls(varlist)
    [lag] [iv()] [round()] [title()]
    [sd] [ci] [p|se]
    [regression_options]
```

## Options

| Option | Description |
|--------|-------------|
| `treatment()` | Binary treatment variable (0=control) with basic controls |
| `controls()` | Additional controls for adjusted ITT regressions |
| `lag` | Add first lag of dependent variable to controls |
| `iv()` | Variable to instrument for contamination-adjusted analysis |
| `round()` | Rounding unit (default: 0.01) |
| `title()` | Table title |
| `sd` | Show standard deviations below means |
| `ci` | Show 95% confidence intervals after estimates |
| `p` | Show p-values below estimates |
| `se` | Show standard errors below estimates |

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
