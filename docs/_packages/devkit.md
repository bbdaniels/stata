---
layout: package
title: devkit
tagline: Developer toolkit with utility functions
category: Specialized Tools
package_name: devkit
---

## Description

`devkit` is a developer toolkit containing utility functions for Stata programming:

## Included Commands

| Command | Description |
|---------|-------------|
| `dirset` | Directory setting utilities |
| `dtaify` | Data file management |
| `hhirange` | HHI range calculations |
| `intervals` | Interval calculations |
| `youngknife` | Jackknife estimation utilities |
| `zcenter` | Z-score centering |

## Installation

```stata
net install devkit, from("https://raw.githubusercontent.com/bbdaniels/stata/main/")
```

This installs all included utility commands.

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
