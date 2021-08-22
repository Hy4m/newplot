#' Init a Annotation Plot
#' @description This function, similar to new_ggplot, is used to initialize an
#' annotated graph.
#' @param plot can be a ggplot, grob or base plot object.
#' @param ... other parameters.
#' @return a modified gg object.
#' @importFrom ggplotify as.ggplot
#' @rdname new_plot
#' @export
new_plot <- function(plot, ...) {
  UseMethod("new_plot")
}

#' @rdname new_plot
#' @method new_plot ggplot
#' @export
new_plot.ggplot <- function(plot, ...) {
  new_ggplot(plot = plot, ...)
}

#' @rdname new_plot
#' @method new_plot grob
#' @export
new_plot.grob <- function(plot, ...) {
  plot <- ggplotify::as.ggplot(plot)
  new_ggplot(plot = plot, ...)
}

#' @rdname new_plot
#' @method new_plot formula
#' @export
new_plot.formula <- function(plot, ...) {
  plot <- ggplotify::as.ggplot(plot)
  new_ggplot(plot = plot, ...)
}

#' @rdname new_plot
#' @method new_plot default
#' @export
new_plot.default <- function(plot, ...) {
  plot <- ggplotify::as.ggplot(plot)
  new_ggplot(plot = plot, ...)
}
