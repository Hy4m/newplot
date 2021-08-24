#' @title Theme
#' @description Theme for removing the x-axis or the y-axis.
#' @param ... other parameters passing to \code{theme()}.
#' @param plot.margin the margin of plot.
#' @return a theme object.
#' @rdname theme
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 margin
#' @export
theme_no_y <- function(...,
                       plot.margin = margin()) {
  theme(...,
        axis.text.y = element_blank(),
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank(),
        plot.margin = plot.margin)
}

#' @rdname theme
#' @export
theme_no_x <- function(...,
                       plot.margin = margin()) {
  theme(...,
        axis.text.x = element_blank(),
        axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank(),
        plot.margin = plot.margin)
}
