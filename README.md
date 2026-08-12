# Stata Packages for Research

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6263355.svg)](https://doi.org/10.5281/zenodo.6263355)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A collection of Stata packages for research, data analysis, and visualization. Developed and maintained by [Benjamin Daniels](http://www.benjaminbdaniels.com).

**[View Full Documentation](https://bbdaniels.github.io/stata/)**

## Installation

Install any package directly from this repository using Stata's `net install`:

```stata
net install packagename, from("https://raw.githubusercontent.com/bbdaniels/stata/main/")
```

For example:
```stata
net install forest, from("https://raw.githubusercontent.com/bbdaniels/stata/main/")
```

## Package Categories

### Visualization

| Package | Description |
|---------|-------------|
| **[betterbar](https://bbdaniels.github.io/stata/packages/betterbar)** | Bar graphs with standard error bars and cross-group comparisons |
| **[forest](https://bbdaniels.github.io/stata/packages/forest)** | Forest plots visualizing results from multiple regressions |
| **[bstrappoly](https://bbdaniels.github.io/stata/packages/bstrappoly)** | Bootstrapped confidence intervals for local polynomial regression |

### Regression & Analysis

| Package | Description |
|---------|-------------|
| **[outwrite](https://bbdaniels.github.io/stata/packages/outwrite)** | Export regression results to Excel, CSV, or LaTeX |
| **[crossfold](https://bbdaniels.github.io/stata/packages/crossfold)** | K-fold cross-validation for model evaluation |
| **[manski](https://bbdaniels.github.io/stata/packages/manski)** | Manski bounds for selection bias |
| **[rctreg](https://bbdaniels.github.io/stata/packages/rctreg)** | RCT regression tables with treatment/control means |
| **[easyirt](https://bbdaniels.github.io/stata/packages/easyirt)** | Easy Item Response Theory estimation |
| **[specc](https://bbdaniels.github.io/stata/packages/specc)** | Specification curve analysis automation |
| **[bivreg](https://bbdaniels.github.io/stata/packages/bivreg)** | Bivariate regression tables |
| **[reftab](https://bbdaniels.github.io/stata/packages/reftab)** | Summary statistics and regression results by category |

### Summary Statistics & Tables

| Package | Description |
|---------|-------------|
| **[sumstats](https://bbdaniels.github.io/stata/packages/sumstats)** | Summary statistics tables with conditional restrictions |
| **[tabstatout](https://bbdaniels.github.io/stata/packages/tabstatout)** | Summary statistics tables with export capability |
| **[weightab](https://bbdaniels.github.io/stata/packages/weightab)** | Weighted cross-group comparison tables |
| **[bintab](https://bbdaniels.github.io/stata/packages/bintab)** | Binary proportions and population estimates |
| **[statflow](https://bbdaniels.github.io/stata/packages/statflow)** | Dynamic flowcharts and tables in Excel |

### Data Management

| Package | Description |
|---------|-------------|
| **[freeshape](https://bbdaniels.github.io/stata/packages/freeshape)** | Flexible reshape without numbered variable stubs |
| **[labelcollapse](https://bbdaniels.github.io/stata/packages/labelcollapse)** | Collapse data while preserving variable labels |
| **[makeid](https://bbdaniels.github.io/stata/packages/makeid)** | Generate unique hierarchical IDs |
| **[tabgen](https://bbdaniels.github.io/stata/packages/tabgen)** | Split categorical variables into labeled binaries |
| **[rencode](https://bbdaniels.github.io/stata/packages/rencode)** | Encode string variables in place |
| **[strprop](https://bbdaniels.github.io/stata/packages/strprop)** | Case formatting for string variables |
| **[dayofweek](https://bbdaniels.github.io/stata/packages/dayofweek)** | Generate labeled day-of-week variables |
| **[anycat](https://bbdaniels.github.io/stata/packages/anycat)** | Create indicators from categorical variable sets |
| **[multicat](https://bbdaniels.github.io/stata/packages/multicat)** | Compile indicators into descriptive strings |

### Specialized Tools

| Package | Description |
|---------|-------------|
| **[knapsack](https://bbdaniels.github.io/stata/packages/knapsack)** | 0/1 Knapsack Problem solver |
| **[txt2qr](https://bbdaniels.github.io/stata/packages/txt2qr)** | Generate QR codes from text |
| **[dta2kml](https://bbdaniels.github.io/stata/packages/dta2kml)** | Export data to KML for geographic visualization |
| **[devkit](https://bbdaniels.github.io/stata/packages/devkit)** | Developer toolkit with utility functions |

## Citation

If you use these packages in your research, please cite:

```bibtex
@software{daniels_stata_packages,
  author       = {Benjamin Daniels},
  title        = {Stata Packages for Research},
  year         = {2024},
  publisher    = {Zenodo},
  doi          = {10.5281/zenodo.6263355},
  url          = {https://doi.org/10.5281/zenodo.6263355}
}
```

## Contributing

Contributions are welcome! Please see the [Code of Conduct](CODE_OF_CONDUCT.md) and submit issues or pull requests on [GitHub](https://github.com/bbdaniels/stata).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
