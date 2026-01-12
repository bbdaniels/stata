---
layout: default
title: All Packages
---

# Package Catalog

Browse all available Stata packages. Click any package for detailed documentation and examples.

<div class="search-box">
  <input type="text" id="package-search" placeholder="Search packages..." onkeyup="filterPackages()">
</div>

<div class="filter-bar">
  <button class="filter-btn active" onclick="filterByCategory('all')">All</button>
  <button class="filter-btn" onclick="filterByCategory('visualization')">Visualization</button>
  <button class="filter-btn" onclick="filterByCategory('regression')">Regression & Analysis</button>
  <button class="filter-btn" onclick="filterByCategory('tables')">Tables</button>
  <button class="filter-btn" onclick="filterByCategory('data')">Data Management</button>
  <button class="filter-btn" onclick="filterByCategory('tools')">Specialized Tools</button>
</div>

<div class="package-grid" id="package-grid">

  <a href="{{ '/packages/betterbar/' | relative_url }}" class="package-card" data-category="visualization" data-name="betterbar">
    <h3>betterbar</h3>
    <p>Bar graphs with standard error bars and cross-group comparisons.</p>
    <span class="category">Visualization</span>
  </a>

  <a href="{{ '/packages/forest/' | relative_url }}" class="package-card" data-category="visualization" data-name="forest">
    <h3>forest</h3>
    <p>Forest plots visualizing results from multiple regressions with effect sizes.</p>
    <span class="category">Visualization</span>
  </a>

  <a href="{{ '/packages/bstrappoly/' | relative_url }}" class="package-card" data-category="visualization" data-name="bstrappoly">
    <h3>bstrappoly</h3>
    <p>Bootstrapped 95% confidence intervals for local polynomial regression.</p>
    <span class="category">Visualization</span>
  </a>

  <a href="{{ '/packages/outwrite/' | relative_url }}" class="package-card" data-category="regression" data-name="outwrite">
    <h3>outwrite</h3>
    <p>Export regression results to Excel, CSV, or LaTeX files.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/crossfold/' | relative_url }}" class="package-card" data-category="regression" data-name="crossfold">
    <h3>crossfold</h3>
    <p>K-fold cross-validation for evaluating out-of-sample model fit.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/manski/' | relative_url }}" class="package-card" data-category="regression" data-name="manski">
    <h3>manski</h3>
    <p>Manski bounding simulations for selection bias analysis.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/rctreg/' | relative_url }}" class="package-card" data-category="regression" data-name="rctreg">
    <h3>rctreg</h3>
    <p>RCT regression tables with treatment/control means and ITT estimates.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/easyirt/' | relative_url }}" class="package-card" data-category="regression" data-name="easyirt">
    <h3>easyirt</h3>
    <p>Easy Item Response Theory estimation with automatic labeling.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/specc/' | relative_url }}" class="package-card" data-category="regression" data-name="specc">
    <h3>specc</h3>
    <p>Specification curve analysis automation across forking paths.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/bivreg/' | relative_url }}" class="package-card" data-category="regression" data-name="bivreg">
    <h3>bivreg</h3>
    <p>Bivariate regression tables.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/reftab/' | relative_url }}" class="package-card" data-category="regression" data-name="reftab">
    <h3>reftab</h3>
    <p>Summary statistics and regression results by reference category.</p>
    <span class="category">Regression</span>
  </a>

  <a href="{{ '/packages/sumstats/' | relative_url }}" class="package-card" data-category="tables" data-name="sumstats">
    <h3>sumstats</h3>
    <p>Summary statistics tables with conditional if-restrictions.</p>
    <span class="category">Tables</span>
  </a>

  <a href="{{ '/packages/tabstatout/' | relative_url }}" class="package-card" data-category="tables" data-name="tabstatout">
    <h3>tabstatout</h3>
    <p>Summary statistics tables with spreadsheet export.</p>
    <span class="category">Tables</span>
  </a>

  <a href="{{ '/packages/weightab/' | relative_url }}" class="package-card" data-category="tables" data-name="weightab">
    <h3>weightab</h3>
    <p>Weighted cross-group comparison tables and bar graphs.</p>
    <span class="category">Tables</span>
  </a>

  <a href="{{ '/packages/statflow/' | relative_url }}" class="package-card" data-category="tables" data-name="statflow">
    <h3>statflow</h3>
    <p>Dynamic flowcharts and custom tables in Excel.</p>
    <span class="category">Tables</span>
  </a>

  <a href="{{ '/packages/freeshape/' | relative_url }}" class="package-card" data-category="data" data-name="freeshape">
    <h3>freeshape</h3>
    <p>Flexible reshape without requiring numbered variable stubs.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/labelcollapse/' | relative_url }}" class="package-card" data-category="data" data-name="labelcollapse">
    <h3>labelcollapse</h3>
    <p>Collapse data while preserving variable and value labels.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/makeid/' | relative_url }}" class="package-card" data-category="data" data-name="makeid">
    <h3>makeid</h3>
    <p>Generate unique hierarchical IDs from strata variables.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/tabgen/' | relative_url }}" class="package-card" data-category="data" data-name="tabgen">
    <h3>tabgen</h3>
    <p>Split categorical variables into labeled binary indicators.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/rencode/' | relative_url }}" class="package-card" data-category="data" data-name="rencode">
    <h3>rencode</h3>
    <p>Encode string variables and replace them in place.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/strprop/' | relative_url }}" class="package-card" data-category="data" data-name="strprop">
    <h3>strprop</h3>
    <p>Case formatting (proper/lower/upper) for string variables.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/dayofweek/' | relative_url }}" class="package-card" data-category="data" data-name="dayofweek">
    <h3>dayofweek</h3>
    <p>Generate labeled day-of-week variables from datetime.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/anycat/' | relative_url }}" class="package-card" data-category="data" data-name="anycat">
    <h3>anycat</h3>
    <p>Create indicator variables from categorical variable sets.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/multicat/' | relative_url }}" class="package-card" data-category="data" data-name="multicat">
    <h3>multicat</h3>
    <p>Compile indicator variables into descriptive string variables.</p>
    <span class="category">Data</span>
  </a>

  <a href="{{ '/packages/knapsack/' | relative_url }}" class="package-card" data-category="tools" data-name="knapsack">
    <h3>knapsack</h3>
    <p>Solve the 0/1 Knapsack Problem for optimal selection.</p>
    <span class="category">Tools</span>
  </a>

  <a href="{{ '/packages/txt2qr/' | relative_url }}" class="package-card" data-category="tools" data-name="txt2qr">
    <h3>txt2qr</h3>
    <p>Generate QR codes from text strings.</p>
    <span class="category">Tools</span>
  </a>

  <a href="{{ '/packages/dta2kml/' | relative_url }}" class="package-card" data-category="tools" data-name="dta2kml">
    <h3>dta2kml</h3>
    <p>Export geographic data to KML for Google Earth visualization.</p>
    <span class="category">Tools</span>
  </a>

  <a href="{{ '/packages/devkit/' | relative_url }}" class="package-card" data-category="tools" data-name="devkit">
    <h3>devkit</h3>
    <p>Developer toolkit with utility functions for Stata programming.</p>
    <span class="category">Tools</span>
  </a>

</div>

<script>
function filterPackages() {
  const search = document.getElementById('package-search').value.toLowerCase();
  const cards = document.querySelectorAll('.package-card');

  cards.forEach(card => {
    const name = card.dataset.name.toLowerCase();
    const text = card.textContent.toLowerCase();
    if (name.includes(search) || text.includes(search)) {
      card.style.display = '';
    } else {
      card.style.display = 'none';
    }
  });
}

function filterByCategory(category) {
  const cards = document.querySelectorAll('.package-card');
  const buttons = document.querySelectorAll('.filter-btn');

  buttons.forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');

  cards.forEach(card => {
    if (category === 'all' || card.dataset.category === category) {
      card.style.display = '';
    } else {
      card.style.display = 'none';
    }
  });
}
</script>
