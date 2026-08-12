{smcl}
{* Feb 26th 2016}
{hline}
Help for {hi:bintab}
{hline}

{title:Description}

{p}{cmd:bintab} produces xlsx sheets of weighted binary proportions and population estimates across categorical groups. Binary variables are reported as counts (n/N) with weighted means and 95% confidence intervals; continuous variables are reported as weighted means with 95% confidence intervals.

{title:Syntax}

{p 2 4}{cmd:bintab} {help varlist} [{help if}] [{help in}] [{help using}] [{help weight}], {opth over(varname)} [{it:options}]

{synoptset 20 tabbed}{...}
{marker Options}{...}
{synopthdr:Primary Options}
{synoptline}
{p2coldent:* {it:varlist}}The list of binary variables to tabulate. Calculations are based on {help svy}: {help mean} using supplied weights.{p_end}
{p2coldent:* {opt weight}}Specify weight variable. Only pweights are currently supported.{p_end}
{p2coldent:* {opth o:ver(varname)}}Produces grouping of observations. Values should be labeled.{p_end}
{break}
{synopthdr:Additional Options}
{synoptline}
{p2coldent:+ {opt using}}Export the final table to the specified spreadsheet.{p_end}
{synopt:{opt continuous(varlist)}}List of continuous variables to report as weighted means with 95% CIs.{p_end}
{synopt:{opt svyset_opts(string)}}Options passed through to {help svyset} (for example, complex survey design settings).{p_end}

{synoptline}
{p 4 6 2}{p_end}

{title:Author}

Benjamin Daniels
bbdaniels@gmail.com

