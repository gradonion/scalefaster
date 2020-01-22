
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void scale_rcpp (NumericMatrix& X, const NumericVector& a, const NumericVector& b) {
  //in place modification of input variables
  for (int j=0; j < X.ncol(); j++)
    for (int i=0; i<X.nrow(); i++)
      X(i,j) = (X(i,j)-a(j))/b(j);
}
