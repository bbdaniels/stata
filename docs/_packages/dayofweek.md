---
layout: package
title: dayofweek
tagline: Generate labeled day-of-week variables
category: Data Management
package_name: dayofweek
---

## Description

`dayofweek` generates and labels a day-of-week variable from a Stata datetime variable.

## Syntax

```stata
dayofweek datetime_variable, generate(newvar) [label(string)]
```

## Options

| Option | Description |
|--------|-------------|
| `generate()` | Name for new variable |
| `label()` | Optional variable label |

## Output

Creates a variable with values 0-6:
- 0 = Sunday
- 1 = Monday
- 2 = Tuesday
- 3 = Wednesday
- 4 = Thursday
- 5 = Friday
- 6 = Saturday

## Requirements

The datetime variable must be in Stata internal datetime format (as used by `dow()`).

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
