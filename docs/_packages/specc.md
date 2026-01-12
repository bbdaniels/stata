---
layout: package
title: specc
tagline: Specification curve analysis automation
category: Regression & Analysis
package_name: specc
github: https://github.com/bbdaniels/specc
---

## Description

`specc` manages component dofiles and alternative specifications for creating specification curves in Stata. It automates the exploration of "the garden of forking paths" in statistical analysis.

The command:
1. Enables assisted creation of sets of alternative options ("methods") for each analytical choice
2. Automatically assembles all decisions into the full set of possible specifications
3. Reduces the programming task for an exponential number of specifications to a linear amount of coding

## Functions

### Initialize

```stata
specc initialize using "/specc/directory/"
```

Creates the directory and database for building a specification curve.

### Create Methods

```stata
specc new class_name method_name
    "Method Description"
    using "/specc/directory/"
    [, code("starter Stata code")] [replace]
```

Creates a new method representing a choice at some stage in the decision tree.

### Remove Methods

```stata
specc remove class_name method_name
    using "/specc/directory/"
```

Deletes a method and its corresponding dofile.

### Set Execution Order

```stata
specc set class_name [class_name] [...] model
    using "/specc/directory/" , reset
```

Instructs `specc` to prepare execution across the specified classes. The `model` class must always be last.

### Report Status

```stata
specc report [class_name method_name]
    using "/specc/directory/" [, sort]
```

Returns the current status of the registry, including available classes and methods.

### Run Analysis

```stata
specc run using "/specc/directory/"
    [, sort] [save] [twoway_options]
```

Executes the full set of specifications and displays the specification curve.

## Workflow Example

```stata
* 1. Initialize the specification curve directory
specc initialize using "analysis/specc/"

* 2. Create methods for different analytical choices
specc new outcomes main "Primary outcome" ///
    using "analysis/specc/", code("gen y = outcome1")

specc new outcomes alt "Alternative outcome" ///
    using "analysis/specc/", code("gen y = outcome2")

specc new controls none "No controls" ///
    using "analysis/specc/", code("local controls")

specc new controls full "Full controls" ///
    using "analysis/specc/", code("local controls age gender income")

* 3. Set the execution order
specc set outcomes controls model using "analysis/specc/", reset

* 4. Check status
specc report using "analysis/specc/"

* 5. Run all specifications
specc run using "analysis/specc/", save
```

## Concept

The "garden of forking paths" refers to the many decisions researchers make during analysis:
- Which outcome measure to use
- Which controls to include
- What functional form to assume
- How to handle missing data
- etc.

`specc` makes it easy to systematically explore all combinations of these choices, producing a specification curve that shows how robust your results are to different analytical decisions.

## References

- Gelman, A. & Loken, E. "The Garden of Forking Paths" (2013)
- Simonsohn, U., Simmons, J.P., & Nelson, L.D. "Specification Curve: Descriptive and Inferential Statistics on All Reasonable Specifications" (2015)

## Author

Benjamin Daniels ([bbdaniels@gmail.com](mailto:bbdaniels@gmail.com))
