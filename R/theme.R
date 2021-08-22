#' @title Theme
#' @description Theme for removing the x-axis or the y-axis.
#' @param ... other parameters passing to \code{theme()}.
#' @return a theme object.
#' @rdname theme
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 element_blank
#' @export
theme_no_y <- function(...) {
  theme(...,
        axis.text.y = element_blank(),
        axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_blank())
}

#' @rdname theme
#' @export
theme_no_x <- function(...) {
  theme(...,
        axis.text.x = element_blank(),
        axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.x = element_blank())
}
