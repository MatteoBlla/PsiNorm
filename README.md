# PsiNorm

<!-- badges: start -->

<!-- badges: end -->

The goal of PsiNorm is to normalize a raw count matrix of expression
genes profiles thanks to the sample specific Pareto shape parameter. The
function first computes the cell specific shape parameter alpha of the
Pareto distribution and then normalizes the samples with it. It estimates the parameter alpha by maximum likelihood, equal to the log geometric mean of the pseudo-sample.
The Pareto parameter is inversely
proportional to the sequencing depth, it is sample specific and its
estimate is performed for each cell independently.

## Installation

You can install the released version of PsiNorm with:

```{r}
remotes::install_github("MatteoBlla/PsiNorm")
```

## Example

See the vignette for example usage.
