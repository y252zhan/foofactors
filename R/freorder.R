#' Reorder Levels of a Factor
#'
#' freorder is a generic function. The "default" method treats its first argument as a categorical variable,
#' and reorders its levels in descending order based on the values of a second variable, usually numeric.
#'
#' @param a An atomic vector, usually a factor (possibly ordered). The vector is treated as a categorical variable
#' whose levels will be descendingly reordered.
#'
#' @param b a vector of the same length as a, whose subset of values for each unique level of a determines the eventual
#' order of that level. b is required to contain numeric values.
#'
#' @return A factor with the order of the levels determined by applying the numeric order of b grouped by a. The levels
#' are ordered such that the values returned are in descending order.
#'
#' @export
#' @examples
#' freorder(school <- c("School A", "SChool B", "School C", "School D", "School E", "School F"), N <- c(25,28,12,22,30,25))
freorder <- function(a, b) {
  testit::assert("arguments must have same length", length(a)==length(b));
  testit::assert("arguments must be vectors", is.vector(a) && is.vector(b));
  testit::assert("the second argument must be numeric", is.numeric(b));
  tmp <- dplyr::tbl_df (data.frame(a));
  inDesc = dplyr::arrange(tmp, desc(b));
  v = as.vector(factor(inDesc$a));
  current_a = a;
  levels(current_a) = v;
  factor(current_a, levels=levels(current_a));
}
