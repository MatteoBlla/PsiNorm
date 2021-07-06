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

The method is described in the paper [Borella et al. (2021)](https://doi.org/10.1101/2021.04.07.438822).

## Important note

The PsiNorm package is deprecated and no longer updated. Since Bioconductor 3.13, the PsiNorm function is available in the [scone package](http://bioconductor.org/packages/release/bioc/html/scone.html) (v >= 1.16.0).

## Installation

You can install the current version of scone, which includes the PsiNorm function, with:

```{r}
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("scone")
```

If you really want to install this version of the package (not recommended for most users), you can do so with:

```{r}
remotes::install_github("MatteoBlla/PsiNorm")
```

## Example

See the [dedicated scone vignette](http://bioconductor.org/packages/release/bioc/vignettes/scone/inst/doc/PsiNorm.html) for example usage.
