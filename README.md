# Stata Packages for Research

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6263355.svg)](https://doi.org/10.5281/zenodo.6263355)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A collection of Stata packages for research, data analysis, and visualization. Developed and maintained by [Benjamin Daniels](http://www.benjaminbdaniels.com).

**[View Full Documentation](https://bbdaniels.com/stata/)**

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
| **[betterbar](https://bbdaniels.com/stata/packages/betterbar)** | Bar graphs with standard error bars and cross-group comparisons |
| **[forest](https://bbdaniels.com/stata/packages/forest)** | Forest plots visualizing results from multiple regressions |
| **[bstrappoly](https://bbdaniels.com/stata/packages/bstrappoly)** | Bootstrapped confidence intervals for local polynomial regression |

### Regression & Analysis

| Package | Description |
|---------|-------------|
| **[outwrite](https://bbdaniels.com/stata/packages/outwrite)** | Export regression results to Excel, CSV, or LaTeX |
| **[crossfold](https://bbdaniels.com/stata/packages/crossfold)** | K-fold cross-validation for model evaluation |
| **[manski](https://bbdaniels.com/stata/packages/manski)** | Manski bounds for selection bias |
| **[rctreg](https://bbdaniels.com/stata/packages/rctreg)** | RCT regression tables with treatment/control means |
| **[easyirt](https://bbdaniels.com/stata/packages/easyirt)** | Easy Item Response Theory estimation |
| **[specc](https://bbdaniels.com/stata/packages/specc)** | Specification curve analysis automation |
| **[bivreg](https://bbdaniels.com/stata/packages/bivreg)** | Bivariate regression tables |
| **[reftab](https://bbdaniels.com/stata/packages/reftab)** | Summary statistics and regression results by category |

### Summary Statistics & Tables

| Package | Description |
|---------|-------------|
| **[sumstats](https://bbdaniels.com/stata/packages/sumstats)** | Summary statistics tables with conditional restrictions |
| **[tabstatout](https://bbdaniels.com/stata/packages/tabstatout)** | Summary statistics tables with export capability |
| **[weightab](https://bbdaniels.com/stata/packages/weightab)** | Weighted cross-group comparison tables |
| **[bintab](https://bbdaniels.com/stata/packages/bintab)** | Binary proportions and population estimates |
| **[statflow](https://bbdaniels.com/stata/packages/statflow)** | Dynamic flowcharts and tables in Excel |

### Data Management

| Package | Description |
|---------|-------------|
| **[freeshape](https://bbdaniels.com/stata/packages/freeshape)** | Flexible reshape without numbered variable stubs |
| **[labelcollapse](https://bbdaniels.com/stata/packages/labelcollapse)** | Collapse data while preserving variable labels |
| **[makeid](https://bbdaniels.com/stata/packages/makeid)** | Generate unique hierarchical IDs |
| **[tabgen](https://bbdaniels.com/stata/packages/tabgen)** | Split categorical variables into labeled binaries |
| **[rencode](https://bbdaniels.com/stata/packages/rencode)** | Encode string variables in place |
| **[strprop](https://bbdaniels.com/stata/packages/strprop)** | Case formatting for string variables |
| **[dayofweek](https://bbdaniels.com/stata/packages/dayofweek)** | Generate labeled day-of-week variables |
| **[anycat](https://bbdaniels.com/stata/packages/anycat)** | Create indicators from categorical variable sets |
| **[multicat](https://bbdaniels.com/stata/packages/multicat)** | Compile indicators into descriptive strings |

### Specialized Tools

| Package | Description |
|---------|-------------|
| **[knapsack](https://bbdaniels.com/stata/packages/knapsack)** | 0/1 Knapsack Problem solver |
| **[txt2qr](https://bbdaniels.com/stata/packages/txt2qr)** | Generate QR codes from text |
| **[dta2kml](https://bbdaniels.com/stata/packages/dta2kml)** | Export data to KML for geographic visualization |
| **[devkit](https://bbdaniels.com/stata/packages/devkit)** | Developer toolkit with utility functions |

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
