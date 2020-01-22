#' @title Fast Centering and Scaling of Matrices
#' @description Does the same thing as the default \code{scale(x)}, but faster.
#' @details Uses \code{\link[matrixStats]{colSds}} from the 
#'   \code{matrixStats} package.
#' @param x A numeric matrix; \code{is.matrix(x)} should be \code{TRUE}
#' @return A numeric matrix in which the columns are centered to have zero mean,
#' and  they are also scaled to have standard deviation of 1.
#' @importFrom matrixStats colSds
#' @importFrom Rcpp evalCpp
#' 
#' @useDynLib scalefaster
#' 
#' @export
scale_faster <- function(x){
  a <- colMeans(x)
  # b <- matrixStats::colSds(x)
  b <- colSds(x)
  # x <- t(t(x)-a)
  # x <- t(t(x)/b)
  scale_rcpp(x,a,b)
  return(x)
}