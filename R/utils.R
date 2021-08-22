is_cpx_ggplot <- function(x) inherits(x, "cpx_ggplot")

is_new_ggplot <- function(x) inherits(x, "new_ggplot")

is_new_annotation <- function(x) inherits(x, "new_annotation")

#' @importFrom utils modifyList
aes_modify <- function (aes1, aes2)
{
  aes <- modifyList(as.list(aes1), as.list(aes2))
  class(aes) <- "uneval"
  aes
}

get_function <- function (pkg, fun)
{
  if (!requireNamespace(pkg, quietly = TRUE)) {
    stop(pkg, " package has not been installed", call. = FALSE)
  }
  eval(parse(text = paste0(pkg, "::", fun)))
}
