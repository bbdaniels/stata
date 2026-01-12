---
layout: package
title: easyirt
tagline: Easy Item Response Theory estimation
category: Regression & Analysis
package_name: easyirt
---

## Description

`easyirt` performs IRT (Item Response Theory) estimates using `openirt`, automatically affixing original ID variables, variable names, and labels to the generated datasets.

## Syntax

```stata
easyirt varlist using [if] [in],
    id(varlist) [theta(theta_label)] [replace]
    [openirt_options]
```

## Options

| Option | Description |
|--------|-------------|
| `id(varlist)` | ID variables for the data |
| `theta(label)` | Label for estimated ability parameters |
| `replace` | Replace existing output files |

## How It Works

1. Collapses the varlist at the `id` level using the first nonmissing value
2. Runs IRT estimation via `openirt`
3. Creates ability parameter estimates file (specified in `using`)
4. Creates item parameters file with `_items.dta` suffix
5. Applies proper labels based on `theta()` option

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
