---
layout: package
title: multicat
tagline: Compile indicators into descriptive strings
category: Data Management
package_name: multicat
---

## Description

`multicat` compiles indicator variables into a single string variable indicating which indicators equal 1 for each observation. The variable labels of the indicators are used in the new string variable.

## Syntax

```stata
multicat indicator_varlist, generate(newvar)
```

## Example

```stata
* If has_car=1, has_bike=0, has_boat=1
* Result: "Has Car; Has Boat"

* If all indicators are 0
* Result: "" (missing)
```

## Use Case

Useful for creating readable summary variables from multiple binary flags, such as listing all selected options in a multiple-choice survey question.

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
