---
layout: package
title: tabgen
tagline: Split categorical variables into binaries
category: Data Management
package_name: tabgen
---

## Description

`tabgen` splits categorical variables into binary indicator variables and correctly labels each category based on the original value labels.

## Syntax

```stata
tabgen varlist
```

## Example

```stata
sysuse auto, clear
tabgen rep78
* Creates: rep78_1, rep78_2, rep78_3, rep78_4, rep78_5
* Each labeled with the original value label
```

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
