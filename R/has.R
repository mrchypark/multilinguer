#' has conda
#'
#' Check if there is a conda, and install if it does not exist.
#'
#' @export
has_conda <- function(){
  if (!conda_available()) {
    install_conda()
  }
  os <- get_os()
  if (grepl("Windows", class(os))) {
    fix_ssl_error()
  }
  invisible(os)
}

#' has not conda
#'
#' Check if there is a conda, and uninstall if it does exist.
#'
#' @export
has_not_conda <- function(){
  os <- get_os()
  if (conda_available()) {
    remove_conda(os)
  }
  invisible(os)
}
