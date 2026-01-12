---
layout: package
title: statflow
tagline: Dynamic flowcharts and tables in Excel
category: Summary Statistics & Tables
package_name: statflow
github: https://github.com/bbdaniels/statflow
---

## Description

`statflow` creates dynamically updating custom tables and flowcharts in Excel. Given a spreadsheet with columns for logic conditions, variables, statistics, and values, it replaces the "value" column with computed statistics.

## Syntax

### Set up template

```stata
statflow template using "/path/to/file.xlsx", [replace]
```

### Update with statistics

```stata
statflow using "/path/to/file.xlsx" [if] [in]
```

## Excel Template Structure

The spreadsheet should have columns:
- **A (logic)**: Stata `if` condition
- **B (var)**: Variable name
- **C (stat)**: Statistic to calculate
- **D (value)**: Replaced with computed value

## Use Cases

- CONSORT flowcharts with sample sizes
- Custom summary tables
- Dynamic reporting dashboards
- Data quality checks

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
