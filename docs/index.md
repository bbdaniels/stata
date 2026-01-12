---
layout: default
title: Home
---

<div class="hero">
  <h1>Stata Packages for Research</h1>
  <p>A collection of open-source Stata packages for research, data analysis, and visualization.</p>
  <div class="hero-buttons">
    <a href="{{ '/packages/' | relative_url }}" class="btn btn-primary">Browse Packages</a>
    <a href="https://github.com/bbdaniels/stata" class="btn btn-secondary">View on GitHub</a>
  </div>
</div>

## Quick Install

Install any package directly in Stata:

```stata
net install packagename, from("https://raw.githubusercontent.com/bbdaniels/stata/main/")
```

## Featured Packages

<div class="package-grid">
  <a href="{{ '/packages/forest/' | relative_url }}" class="package-card">
    <h3>forest</h3>
    <p>Create forest plots visualizing results from multiple regressions with effect sizes and error control.</p>
    <span class="category">Visualization</span>
  </a>

  <a href="{{ '/packages/outwrite/' | relative_url }}" class="package-card">
    <h3>outwrite</h3>
    <p>Export regression results to Excel, CSV, or LaTeX with customizable formatting.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/betterbar/' | relative_url }}" class="package-card">
    <h3>betterbar</h3>
    <p>Bar graphs with standard error bars and cross-group comparisons.</p>
    <span class="category">Visualization</span>
  </a>

  <a href="{{ '/packages/crossfold/' | relative_url }}" class="package-card">
    <h3>crossfold</h3>
    <p>K-fold cross-validation to evaluate model out-of-sample fit.</p>
    <span class="category">Analysis</span>
  </a>

  <a href="{{ '/packages/specc/' | relative_url }}" class="package-card">
    <h3>specc</h3>
    <p>Automate specification curve analysis across the garden of forking paths.</p>
    <span class="category">Analysis</span>
  </a>

  <a href="{{ '/packages/sumstats/' | relative_url }}" class="package-card">
    <h3>sumstats</h3>
    <p>Generate summary statistics tables with conditional restrictions.</p>
    <span class="category">Tables</span>
  </a>
</div>

<p style="text-align: center; margin-top: 2rem;">
  <a href="{{ '/packages/' | relative_url }}" class="btn btn-primary">View All 28 Packages</a>
</p>

## Citation

If you use these packages in your research, please cite:

```bibtex
@software{daniels_stata_packages,
  author       = {Benjamin Daniels},
  title        = {Stata Packages for Research},
  year         = {2024},
  publisher    = {Zenodo},
  doi          = {10.5281/zenodo.6263355}
}
```

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6263355.svg)](https://doi.org/10.5281/zenodo.6263355)
