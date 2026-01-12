---
layout: package
title: labelcollapse
tagline: Collapse preserving variable labels
category: Data Management
package_name: labelcollapse
---

## Description

`labelcollapse` performs `collapse` while preserving variable and value labels that would otherwise be lost.

## Syntax

```stata
labelcollapse clist [if] [in] [weight],
    [vallab(varlist)] [collapse_options]
```

## Options

| Option | Description |
|--------|-------------|
| `vallab(varlist)` | Also preserve value labels for these variables |

All other options are passed to `collapse`.

## Example

```stata
* Standard collapse loses labels
sysuse auto, clear
collapse (mean) price mpg, by(foreign)
* Variable labels are gone!

* labelcollapse preserves them
sysuse auto, clear
labelcollapse (mean) price mpg, by(foreign)
* Labels retained!
```

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
