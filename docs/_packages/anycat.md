---
layout: package
title: anycat
tagline: Create indicators from categorical sets
category: Data Management
package_name: anycat
---

## Description

Given a set of coded and labeled variables with the same value label, `anycat` creates an indicator variable for each observation for each possible value of the label.

## Syntax

```stata
anycat stub_name
```

## Use Case

When you have multiple variables (e.g., `choice_1`, `choice_2`, `choice_3`) that all use the same value labels, `anycat` creates indicators for whether each label value appears in any of the variables for each observation.

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
