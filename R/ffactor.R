#' Factors
#'
#' The function ffactor is used to encode a vector as a factor that sets levels to the order in which they appear in the data
#'
#' @param a vector of data, usually taking a small number of distinct values.
#'
#' @return ffactor returns an object of class "factor" which has its levels set to the order as they appear in the data as unique entries
#' @export
#' @examples
#' ffactor(c("C", "D", "B", "A"))
ffactor <- function(a) {
  testit::assert("argument must be a vector", is.vector(a));
  v = as.vector(factor(a));
  levels(a) = unique(v);
  factor(a, levels=levels(a));
}
