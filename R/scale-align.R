#' @title Align the Annotation Plot
#' @description Align the annotation plot by the main plot.
#' @param limits limits of coordinate.
#' @return a gg object.
#' @rdname scale_align
#' @importFrom aplot xlim2
#' @importFrom aplot ylim2
#' @export
scale_align <- function(limits = NULL) {
  structure(list(limits), class = "scale_align")
}

#' @export
ggplot_add.scale_align <- function(object, plot, object_name) {
  if(!is_new_annotation(plot)) {
    warning("`scale_align()` just support for new annotation.", call. = FALSE)
    return(plot)
  }

  p <- attr(plot, "plot")
  clss <- unlist(strsplit(class(plot)[2], "_"))[3]
  if(clss %in% c("left", "right")) {
    plot <- plot + ylim2(p, limits = object$limits)
  } else {
    plot <- plot + xlim2(p, limits = object$limits)
  }
  plot
}
