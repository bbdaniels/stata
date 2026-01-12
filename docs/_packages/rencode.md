---
layout: package
title: rencode
tagline: Encode string variables in place
category: Data Management
package_name: rencode
---

## Description

`rencode` encodes string variables and replaces them with the encoded numeric version, preserving the variable name.

## Syntax

```stata
rencode string_varlist
```

## Example

```stata
* Standard encode requires a new variable name
encode mystring, gen(mystring_num)

* rencode replaces in place
rencode mystring
* mystring is now numeric with value labels
```

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
