### This part of the code is implemented by referring to the as.aplot()
### function in aplot package.
### URL:https://github.com/YuLab-SMU/aplot/blob/master/R/aplot.R

#' @title Coerce to a Complex Ggplot
#' @description Functions to coerce a object to a cpx_ggplot if possible.
#' @param plot a ggplot object.
#' @return a cpx_ggplot object.
#' @rdname as_cpx_ggplot
#' @references Guangchuang Yu (2020). aplot: Decorate a 'ggplot' with Associated
#' Information. R package version 0.0.6.https://CRAN.R-project.org/package=aplot
as_cpx_ggplot <- function(plot) {
  UseMethod("as_cpx_ggplot")
}

#' @method as_cpx_ggplot ggplot
#' @rdname as_cpx_ggplot
#' @export
as_cpx_ggplot.ggplot <- function(plot) {
  structure(plot,
            r = list(),
            l = list(),
            t = list(),
            b = list(),
            width = 1,
            height = 1,
            class = c("cpx_ggplot", class(plot)))
}

#' @method as_cpx_ggplot new_annotation
#' @rdname as_cpx_ggplot
as_cpx_ggplot.new_annotation <- function(plot) {
  clss <- class(plot)[2L]
  p <- attr(plot, "plot")
  class(plot) <- c("ggplot", "gg")
  r <- attr(p, "r")
  l <- attr(p, "l")
  t <- attr(p, "t")
  b <- attr(p, "b")

  if(grepl("right", clss, fixed = TRUE)) {
    r <- c(r, list(plot))
  }
  if(grepl("left", clss, fixed = TRUE)) {
    l <- c(l, list(plot))
  }
  if(grepl("top", clss, fixed = TRUE)) {
    t <- c(t, list(plot))
  }
  if(grepl("bottom", clss, fixed = TRUE)) {
    b <- c(b, list(plot))
  }
  structure(p,
            r = r,
            l = l,
            t = t,
            b = b,
            width = attr(p, "width"),
            height = attr(p, "height"),
            class = c("cpx_ggplot", class(plot)))
}


