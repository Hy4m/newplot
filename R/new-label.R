#' @title Add Label Annotation
#' @description Functions to add a text label.
#' @param label a character vector.
#' @param width a positive numeric, indicating the width of a row annotation.
#' @param height a positive numeric, indicating the height of a column annotation.
#' @param dir on of "right", "left", "top" or "bottom", indicating the position
#' of the annotation plot.
#' @param element_height the panel height of each label.
#' @param element_width the panel width of each label.
#' @param ... other parameters for \code{grid::textGrob()}.
#' @return a modified gg object.
#' @importFrom grid textGrob
#' @rdname new_label
#' @export
new_label <- function(label,
                      width = 0.2,
                      height = 0.2,
                      dir = "right",
                      element_height = NULL,
                      element_width = NULL,
                      ...) {
  dir <- match.arg(dir, c("right", "left", "top", "bottom"))
  n <- length(label)
  if(n < 1) {
    return(new_plot(plot_spacer(), dir = dir, width = width, height = height))
  }

  if(dir %in% c("right", "left")) {
    if(is.null(element_height)) {
      element_height <- 1
    }
    element_height <- rep_len(element_height, n)
    grob <- lapply(label, function(.label) {
      as.ggplot(grid::textGrob(.label, ...))
    })
    grob <- Reduce("+", grob) +
      plot_layout(ncol = 1,
                  nrow = n,
                  byrow = TRUE,
                  heights = element_height)
  } else {
    if(is.null(element_width)) {
      element_width <- 1
    }
    element_width <- rep_len(element_width, n)
    grob <- lapply(label, function(.label) {
      as.ggplot(grid::textGrob(.label, ...))
    })
    grob <- Reduce("+", grob) +
      plot_layout(ncol = n,
                  nrow = 1,
                  byrow = TRUE,
                  widths = element_width)
  }
  new_plot(as.ggplot(grob), dir = dir, width = width, height = height)
}
