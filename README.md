
<!-- README.md is generated from README.Rmd. Please edit that file -->

# parsec

<!-- badges: start -->

<!-- badges: end -->

The goal of parsec is to normalize a raw-counting matrix of expression
genes profiles thanks to the sample specific Pareto shape parameter. The
function first computes the cell specific shape parameter *a* of the
Pareto distribution and then normalize the samples with it. By maximum
likelihood method it estimates the parameter *a* equal to the log
geometric mean of the pseudo-sample. The Pareto parameter is inversely
proportional to the sequencing depth, it is sample specific and its
estimate is performed for each cell independently. The normalized counts
are equal to log2(*a*x+1) where x is each cell sample.

## Installation

You can install the released version of parsec from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("parsec")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(parsec)
## basic example code
m<-matrix(c(1,0,2,0,2,9,3,0), ncol=2) # a raw counting matrix
sce<-SingleCellExperiment::SingleCellExperiment(assays=list(counts=m))

sce<-pareto_norm(sce) # SingleCellExperiment object
norm.matrix<-pareto_norm(m) # normalized matrix object
#> [1] "Time consuming: 0 seconds"  "Time consuming: 0 seconds" 
#> [3] "Time consuming: 0 seconds"  "Time consuming: NA seconds"
#> [5] "Time consuming: NA seconds"
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
#summary(cars)
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
