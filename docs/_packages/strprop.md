---
layout: package
title: strprop
tagline: Case formatting for string variables
category: Data Management
package_name: strprop
---

## Description

`strprop` replaces string variables with case-formatted text (proper, lower, or upper case). It can also rename variables to lowercase and strip special characters.

## Syntax

```stata
strprop varlist, case(proper|lower|upper)
    [names] [strip(characters)]
```

## Options

| Option | Description |
|--------|-------------|
| `case()` | Case format: proper, lower, or upper |
| `names` | Also rename variables to lowercase |
| `strip()` | Remove specified characters plus `[ ] \ ^ % . \| ? * + ( )` |

## Example

```stata
* Format all string variables to proper case
strprop *, case(proper)

* Convert to lowercase and clean up
strprop name address, case(lower) strip(".,;")
```

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
