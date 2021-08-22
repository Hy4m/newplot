#' @title Helper Functions
#' @description A wrapper of \code{new_ggplot()} and \code{new_plot()}.
#' @param ... other parameters.
#' @return a modified gg object.
#' @rdname helper_funs
#' @export
new_ggplot_r <- function(...) {
  new_ggplot(..., dir = "right")
}

#' @rdname helper_funs
#' @export
new_ggplot_l <- function(...) {
  new_ggplot(..., dir = "left")
}

#' @rdname helper_funs
#' @export
new_ggplot_b <- function(...) {
  new_ggplot(..., dir = "bottom")
}

#' @rdname helper_funs
#' @export
new_ggplot_t <- function(...) {
  new_ggplot(..., dir = "top")
}
