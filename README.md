
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PsiNorm

<!-- badges: start -->

<!-- badges: end -->

The goal of PsiNorm is to normalize a raw-counting matrix of expression
genes profiles thanks to the sample specific Pareto shape parameter. The
function first computes the cell specific shape parameter α of the
Pareto distribution and then normalize the samples with it. By maximum
likelihood method it estimates the parameter α equal to the log
geometric mean of the pseudo-sample. The Pareto parameter is inversely
proportional to the sequencing depth, it is sample specific and its
estimate is performed for each cell independently. The normalized counts
are equal to log2(xα+1) where x is each cell sample.

## Installation

You can install the released version of PsiNorm from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("PsiNorm")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(PsiNorm)

# possible input objects
m<-matrix(c(1,0,2,0,2,9,3,0), ncol=2) # a raw counting matrix
sce<-SingleCellExperiment::SingleCellExperiment(assays=list(counts=m))

sce<-pareto_norm(sce) # SingleCellExperiment object
norm.matrix<-pareto_norm(m) # normalized matrix object
```
