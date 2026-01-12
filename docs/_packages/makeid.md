---
layout: package
title: makeid
tagline: Generate unique hierarchical IDs
category: Data Management
package_name: makeid
github: https://github.com/bbdaniels/makeid
---

## Description

`makeid` creates unique IDs for every observation based on hierarchical strata variables. IDs are coded and nested so that higher-level codes are unique across the dataset while lower-level codes are unique within their parent groups.

## Syntax

```stata
makeid varlist, generate(newvarname) project(Project Name)
```

## How It Works

Given a variable list like `country state district name`:

1. Country code is fully unique
2. State code is unique within country
3. District code is unique within country+state
4. Name code is unique within country+state+district

The ID is prefixed with the first letter of the project name to prevent automatic conversion to numbers in Excel.

## Example

```stata
sysuse auto.dta, clear
makeid foreign make, gen(uniqueid) project(Demo)
isid uniqueid, sort
list foreign make uniqueid in 1/5

     | foreign   make          uniqueid |
     |----------------------------------|
  1. | Domestic  AMC Concord   D-0-00   |
  2. | Domestic  AMC Pacer     D-0-01   |
  3. | Domestic  AMC Spirit    D-0-02   |
  4. | Domestic  Buick Century D-0-03   |
  5. | Domestic  Buick Electra D-0-04   |
```

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
