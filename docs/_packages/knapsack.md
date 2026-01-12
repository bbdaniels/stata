---
layout: package
title: knapsack
tagline: 0/1 Knapsack Problem solver
category: Specialized Tools
package_name: knapsack
github: https://github.com/bbdaniels/knapsack
---

## Description

`knapsack` implements a solution for the 0/1 Knapsack Problem. Given a budget constraint and items with costs and values, it finds the set of items that maximizes total value while staying within budget.

## Syntax

```stata
knapsack budget, price(varname) value(varname) [generate(newvarname)]
```

## Options

| Option | Description |
|--------|-------------|
| `price(varname)` | Variable containing item costs |
| `value(varname)` | Variable containing item values |
| `generate(newvar)` | Create indicator for items in optimal set |

## Example

```stata
* Each observation is an item with a cost and value
* Find optimal selection within budget of 100
knapsack 100, price(cost) value(benefit) gen(selected)

* selected = 1 for items in optimal set
* selected = 0 for items not selected
```

## Algorithm

Uses dynamic programming solution as described in the [TU Eindhoven lecture notes](http://www.es.ele.tue.nl/education/5MC10/Solutions/knapsack.pdf).

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
