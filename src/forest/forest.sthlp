{smcl}
{* Feb 3rd 2020}
{hline}
Help for {hi:forest}
{hline}

{title:Description}

{p}{cmd: forest} visualizes results from multiple regressions on a single independent variable.
The resulting "forest"-style chart shows the effect of a single "treatment" variable of interest on some set of dependent variables.
It can display raw coefficients, standardized effect sizes (Cohen's {it:d}), or odds ratios (from logistic regressions).
It can also make corrections to the confidence intervals or significance estimates for family-wise error control.{p_end}

{p}{it:Note:} {cmd:forest} currently requires that the form of the estimates
are those returned by the standard {help regress} command.
That is, estimates are extracted from the first row of the `r(table)' matrix
after the estimation command. Commands that do not follow this structure
will return incorrect values.

{title:Syntax}

{p 2 4}{cmd: forest} {it:estimator} ({it:depvar family}) [({it:depvar family})] [...]
{break} [{help weight}] [{help if}] [{help in}]{p_end}
{p 2 4}, {opth rhs:(varlist)} [{opt reg:opts(estimation options)}]
{break} [{bf:or|d}] [{opt b:onferroni}|{opt bh}] [{opt mde}] [{opt crit:ical(value)}]
{break} [{bf:sort}({it:local}|{it:global})] [{opth graph:opts(twoway_options)}] {p_end}


{synoptset 16 tabbed}{...}
{marker Options}{...}
{synopthdr:Syntax}
{synoptline}
{p 4 2}{bf:Required Inputs}{p_end}{break}{break}
{synopt:{opt estimator}}Indicates the estimation command to be utilized.{p_end}{break}
{synopt:({it:depvar family})}List the left-hand-side variables in families for error control.
At least one family of dependent variables is required and the parentheses are required.{p_end}{break}
{synopt:{opt rhs()}}List the independent variable of interest, controls, and any other material as needed.{p_end}{break}
{synopt:{opt reg:opts()}}Specify any options needed for the estimator.{p_end}
{break}
{p 4 2}{bf:Modelling Options}{p_end}{break}{break}
{synopt:{opt c:ontrols()}}Specify control variables.
Use "@" to signify the name of the current left-hand-side variable when needed,
such as {bf:controls(L.@)} to control for lagged values after {help xtset}.{p_end}
{break}
{synopt:{opt crit:ical()}}Specify critical p-value for highlighting significant results (default = 0.05).{p_end}
{break}
{synopt:{opt or|d}}Request effect sizes as odds ratios (by exponentiating regression coefficients where possible)
or in terms of Cohen's {it:d} (by standardizing the dependent variables). Choose only one.{p_end}
{break}
{synopt:{opt b:onferroni}}Request confidence intervals calculated with Bonferroni correction for simultaneous comparisons.
This is calculated by adjusting the significance level to (100-5/({it:number of regressions})) per family.{p_end}
{break}
{synopt:{opt bh}}Request Benjamini-Hochberg significance for simultaneous comparisons.
This is calculated by comparing the raw p-value against ({it:rank}/({it:number of regressions}))*0.05 per family.{p_end}
{break}
{synopt:{opt mde}}Request illustration of minimum detectable effects at 80% power,
calculated as the critical value plus the 20th percentile of the appropriate T-distribution.
Uses Bonferroni critical values if {opt bonferroni} is specified.{p_end}
{break}
{p 4 2}{bf:Display Options}{p_end}{break}{break}
{synopt:{opt sort(type)}}Request that results be sorted from the smallest result to the largest.
The {it:local} option sorts within each family;
the {it:global} option applies the sort to all specified results.{p_end}
{break}
{synopt:{opt graph:opts()}}Set any desired options for the graph.{p_end}
{synoptline}
{p 4 4}* Both {opt b:onferroni} and {opt bh} can be specified, but they produce different adjustments –
Bonferroni control will adjust the confidence intervals, and Benjamini-Hochberg control will adjust the significance.
It is possible to have a BH-significant result whose CI includes the null, with or without Bonferroni adjustment.{p_end}

{title:Examples}

{stata sysuse auto, clear : sysuse auto, clear}
{stata gen check = rep78 > 3 : gen check = rep78 > 3}
{stata gen check2 = 1-foreign : gen check2 = 1-foreign}
{stata label val check origin : label val check origin}

{stata forest reg (headroom foreign) , t(rep78) : forest reg (headroom foreign) , t(rep78)}
{stata forest reg (headroom foreign) , t(rep78) d : forest reg (headroom foreign) , t(rep78) d}
{stata forest reg (headroom foreign) , t(rep78) b : forest reg (headroom foreign) , t(rep78) b}
{stata forest reg (headroom foreign) , t(rep78) bh : forest reg (headroom foreign) , t(rep78) bh}
{stata forest logit (check2 foreign) , t(check) or : forest logit (check2 foreign) , t(check) or}

{title:Author}

Benjamin Daniels
bbdaniels@gmail.com

{title:Contributing}

{p}{bf: forest} is open for development on {browse "https://github.com/bbdaniels/forest":GitHub}.
Submit bugs and feature requests {browse "https://github.com/bbdaniels/forest/issues":here}.
If you like {bf:forest}, be sure to visit my {browse "http://www.benjaminbdaniels.com":homepage}.{p_end}
