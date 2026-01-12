---
layout: package
title: crossfold
tagline: K-fold cross-validation for model evaluation
category: Regression & Analysis
package_name: crossfold
github: https://github.com/bbdaniels/crossfold
---

## Description

`crossfold` performs *k*-fold cross-validation on a specified model to evaluate its ability to fit out-of-sample data.

The procedure:
1. Splits data randomly into *k* partitions
2. For each partition, fits the model using the other *k*-1 groups
3. Uses resulting parameters to predict the dependent variable in the held-out group
4. Reports a goodness-of-fit measure from each fold

The default evaluation metric is root mean squared error (RMSE).

## Syntax

```stata
crossfold model [if] [in] [weight],
    [eif()] [ein()] [eweight(varname)]
    [stub(string)] [k(value)] [loud]
    [mae] [r2]
    [model_options]
```

## Options

| Option | Description |
|--------|-------------|
| `eif()` / `ein()` | Restrictions on the out-of-sample evaluation set |
| `eweight(varname)` | Weighting for error evaluation |
| `stub(string)` | Stub name for estimation results (default: "est") |
| `k(value)` | Number of folds (default: 5, max: 300) |
| `loud` | Display each model as it is fit |
| `mae` | Calculate mean absolute error instead of RMSE |
| `r2` | Calculate pseudo-R-squared instead of RMSE |

## Examples

```stata
* Load data
sysuse nlsw88

* Basic 5-fold cross-validation with RMSE
crossfold reg wage union

             |      RMSE
-------------+-----------
        est1 |  4.171849
        est2 |  4.105884
        est3 |  4.038483
        est4 |  4.151482
        est5 |  4.171727

* Using mean absolute error
crossfold reg wage union, mae

* Using pseudo-R-squared
crossfold reg wage hours grade i.race i.industry i.occupation, r2

* With weights and 3 folds
crossfold qreg wage union collgrad age grade [weight=hours], ///
    eweight(hours) k(3) mae
```

## Saved Results

| Result | Description |
|--------|-------------|
| `r(stub)` | Matrix containing model errors (named `r(est)` by default) |
| `stub1` ... `stubk` | Model parameters, recallable with `estimates restore` |

## References

- Schonlau, Matthias. "Boosted regression (boosting): An introductory tutorial and a Stata plugin." *The Stata Journal* (2005). 5(3): 330-354.

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
