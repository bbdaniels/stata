---
layout: package
title: manski
tagline: Manski bounds for selection bias
category: Regression & Analysis
package_name: manski
github: https://github.com/bbdaniels/manski
---

## Description

`manski` implements Manski bounding simulations as described in Andrabi and Das (2017). For a binary treatment and binary outcome variable, the command performs "extreme" bounds analysis where all missing observations are assigned outcomes that would produce the least significant treatment effect.

The simulation relaxes this assumption by varying the "bounding fraction" until outcome simulation is random in both treatment and control groups, which induces measurement error proportional to the number of missing values.

The output graph shows:
- The relaxation process
- Bounding fractions at which p<0.01 and p<0.05 are attained
- The estimated effect from the original model on non-missing data

## Syntax

```stata
manski regression_model [if] [in],
    treatment(varname) outcome(varname) seed(integer)
    [regression_options]
```

## Requirements

- `treatment` and `outcome` must be binary variables
- `treatment` must be the first variable in the regression
- The regression command must produce standard results (as in `regress`)

## Example

```stata
clear
set obs 1000
matrix c = (1,-.5,0 \ -.5,1,.4 \ 0,.4,1)
corr2data x y z, corr(c)

replace x = 1 if x > 0
replace x = 0 if x < 0
replace y = 1 if y > 0
replace y = 0 if y < 0
replace x = . if z > .5

manski reg x y z, t(y) o(x)
graph export manski.png, replace
```

## References

Andrabi, T. & Das, J. (2017). "In Aid We Trust: Hearts and Minds and the Pakistan Earthquake of 2005." *The Review of Economics and Statistics*, 99(3), 371-386.

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
