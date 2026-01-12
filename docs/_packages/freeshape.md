---
layout: package
title: freeshape
tagline: Flexible reshape without numbered stubs
category: Data Management
package_name: freeshape
---

## Description

`freeshape` reshapes any variable list to long format without requiring numbered variable stubs (like `var1`, `var2`, etc.). It generates a sequenced ID and preserves original variable information.

## Syntax

```stata
freeshape varlist, i(id_varlist) j(newvar_stub)
```

## Generated Variables

| Variable | Description |
|----------|-------------|
| `j_index` | Sequential ID for reshaped observations |
| `j_name` | Original variable name |
| `j_label` | Original variable label |
| `j_value` | Variable value |

## Example

```stata
* Original wide data with non-numbered variables
sysuse auto, clear
freeshape price mpg weight, i(make) j(measure)

* Result: long format with measure_index, measure_name, etc.
```

## When to Use

- Variables aren't named with numeric suffixes
- You want to preserve variable metadata
- Standard `reshape` syntax is cumbersome

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
