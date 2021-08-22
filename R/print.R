#' @method print cpx_ggplot
#' @export
print.cpx_ggplot <- function(x, ...) {
  x <- cpx_ggplot_build(x)
  print(x)
}

#' @method print new_annotation
#' @export
print.new_annotation <- function(x, ...) {
  x <- cpx_ggplot_build(x)
  print(x)
}
