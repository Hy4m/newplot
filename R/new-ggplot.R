#' Init a Annotation Plot
#' @description \code{new_ggplot()} initializes a ggplot object, and all
#' subsequent elements are part of the annotation diagram.
#' @param data NULL or a data frame.
#' @param mapping default list of aesthetic mappings to use for plot.
#' @param width a positive numeric, indicating the width of a row annotation.
#' @param height a positive numeric, indicating the height of a column annotation.
#' @param dir on of "right", "left", "top" or "bottom", indicating the position
#' of the annotation plot.
#' @param inherit.aes if FALSE, overrides the default aesthetics, rather than
#' combining with them.
#' @param plot NULL or a ggplot object.
#' @return a modified gg object.
#' @rdname new_ggplot
#' @importFrom ggplot2 aes
#' @export
new_ggplot <- function(data = NULL,
                       mapping = aes(),
                       width = NULL,
                       height = NULL,
                       dir = "right",
                       inherit.aes = FALSE,
                       plot = NULL) {
  dir <- match.arg(dir, c("right", "left", "top", "bottom"))
  if(dir %in% c("left", "right")) {
    if(is.null(width)) {
      width <- 0.2
    }
    if(!is.numeric(width) || length(width) != 1L || width <= 0) {
      stop("Invalid width params.", call. = FALSE)
    }
    if(!is.null(height)) {
      height <- NULL
    }
  } else {
    if(is.null(height)) {
      height <- 0.2
    }
    if(!is.numeric(height) || length(height) != 1L || height <= 0) {
      stop("Invalid height params.", call. = FALSE)
    }

    if(!is.null(width)) {
      width <- NULL
    }
  }

  structure(list(data = data,
                 mapping = mapping,
                 width = width,
                 height = height,
                 inherit.aes = inherit.aes,
                 dir = dir,
                 plot = plot), class = "new_ggplot")
}

#' @importFrom ggplot2 ggplot_add
#' @importFrom ggplot2 ggplot
#' @export
ggplot_add.new_ggplot <- function(object, plot, object_name) {
  if(!is_cpx_ggplot(plot)) {
    plot <- as_cpx_ggplot(plot)
  }
  if(is.null(object$plot)) {
    data <- object$data
    mapping <- object$mapping
    if(is.null(data)) {
      data <- plot$data
    }
    if(isTRUE(object$inherit.aes)) {
      mapping <- aes_modify(plot$mapping, mapping)
    }
    object$plot <- ggplot(data = data, mapping = mapping)
  }

  if(object$dir == "right") {
    attr(plot, "width") <- c(attr(plot, "width"), object$width)
  } else if(object$dir == "left") {
    attr(plot, "width") <- c(object$width, attr(plot, "width"))
  } else if(object$dir == "top") {
    attr(plot, "height") <- c(object$height, attr(plot, "height"))
  } else {
    attr(plot, "height") <- c(attr(plot, "height"), object$height)
  }

  clss <- paste("new_annotation", object$dir, sep = "_")

  structure(object$plot,
            plot = plot,
            class = c("new_annotation", clss, class(object$plot)))
}
