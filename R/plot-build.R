### The code below is implemented by referring to the plot_list()
### function in aplot package.
### URL:https://github.com/YuLab-SMU/aplot/blob/master/R/plot-list.R

#' @title Build Complex Ggplot
#' @description trans a cpx_ggplot object to patchwork.
#' @param plot a cpx_ggplot object.
#' @return a patchwork object.
#' @rdname cpx_ggplot_build
#' @importFrom patchwork plot_spacer
#' @importFrom patchwork plot_layout
#' @references Guangchuang Yu (2020). aplot: Decorate a 'ggplot' with Associated
#' Information. R package version 0.0.6.https://CRAN.R-project.org/package=aplot.
cpx_ggplot_build <- function(plot) {
  UseMethod("cpx_ggplot_build")
}

#' @rdname cpx_ggplot_build
#' @method cpx_ggplot_build cpx_ggplot
cpx_ggplot_build.cpx_ggplot <- function(plot) {
  r <- attr(plot, "r")
  l <- attr(plot, "l")
  t <- attr(plot, "t")
  b <- attr(plot, "b")

  width <- attr(plot, "width")
  height <- attr(plot, "height")

  class(plot) <- setdiff(class(plot), "cpx_ggplot")
  if (all(length(r) == 0 && length(l) == 0 &&
          length(t) == 0 && length(b) == 0)) {
    return(plot)
  }

  n <- length(r) + length(l) + 1
  m <- length(t) + length(b) + 1
  ll <- rep_len(list(plot_spacer()), m * n)
  temp <- matrix(seq_len(m * n), nrow = m, ncol = n, byrow = TRUE)

  id_cols <- temp[, length(l) + 1]
  id_rows <- temp[length(t) + 1, ]

  ll[id_cols] <- c(t, list(plot), b)
  ll[id_rows] <- c(l, list(plot), r)

  Reduce("+", ll) +
    plot_layout(ncol = n,
                nrow = m,
                byrow = TRUE,
                widths = width,
                heights = height, guides = "collect")

}

#' @rdname cpx_ggplot_build
#' @method cpx_ggplot_build new_annotation
cpx_ggplot_build.new_annotation <- function(plot) {
  plot <- as_cpx_ggplot(plot)
  cpx_ggplot_build(plot)
}
