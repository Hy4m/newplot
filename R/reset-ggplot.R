#' @title Reset Ggplot
#' @description change annotation mode to main plot mode.
#' @return a gg object.
#' @rdname reset_ggplot
#' @export
reset_ggplot <- function() {
  structure(list(), class = "reset_ggplot")
}

#' @export
ggplot_add.reset_ggplot <- function(object, plot, object_name) {
  as_cpx_ggplot(plot)
}
