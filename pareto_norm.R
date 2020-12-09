#' PsiNorm
#'
#' Normalization of a raw counts matrix using the estimate of the shape parameter of the Pareto distribution
#'
#' @param sce A SingleCellExperiment object or a counting matrix with genes in rows and cellular samples in columns.
#'
#' @return If the input is a SingleCellExperiment object the function return the same object adding in the assays the Pareto normalized count matrix. If the input is a matrix pareto_norm returns a normalized matrix with the same dimensions.
#' @export
#'
#' @examples
#' m<-matrix(c(1,0,2,0,2,9,3,0), ncol=2)
#' sce<-SingleCellExperiment::SingleCellExperiment(assays=list(counts=m))
#'
#' sce<-pareto_norm(sce) # SingleCellExperiment object
#' norm.matrix<-pareto_norm(m) # normalized matrix object
#'
pareto_norm <- function(sce) {
  pareto.MLE <- function(sce) {
    n <- nrow(sce)
    m <- MatrixGenerics::colMins(sce)
    a <- n/MatrixGenerics::colSums2(t(t(log(sce)) - log(m)))
    return(a)
  }
  
  if(class(sce)[1]=="SingleCellExperiment"){
    c <- SingleCellExperiment::counts(sce)
    tp <- system.time({
      alfa <- pareto.MLE(c+1)
      m <- log2(t(t(c)*alfa)+1)
      SummarizedExperiment::assay(sce, "Pareto") <- m
    })
    method_name = "Pareto"
    method_type = "norm"
    if (!is.null(S4Vectors::metadata(sce)$running_time)){
      S4Vectors::metadata(sce)$running_time = rbind(S4Vectors::metadata(sce)$running_time, data.frame(method=method_name, method_type=method_type, time=unname(tp)[1]))
    }else{
      S4Vectors::metadata(sce)$running_time = data.frame(method=method_name,method_type=method_type,time=unname(tp)[1])
    }
    
    return(sce)
  }
  
  else if(class(sce)[1]=="matrix" & BiocGenerics::type(sce)=="double"){
    tp <- system.time({
      alfa <- pareto.MLE(sce+1)
      m <- log2(t(t(sce)*alfa)+1)
    })
    print(paste("Time consuming:", tp, "seconds"))
    return(m)
  }
  
  else(print("Need a counting matrix or a SingleCellExperiment object!"))
  
}
