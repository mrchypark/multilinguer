#' has conda
#'
#' Check if there is a conda, and install if it does not exist.
#'
#' @param update defualt is T with conda update.
#' @import conda4r
#' @export
has_conda <- function(update = TRUE){
  if (!conda4r::conda_available()) {
    conda4r::install_conda()
  }
  if (update){
    conda4r::update_conda()
  }
  os <- conda4r::get_os()
  if (grepl("Windows", class(os))) {
    conda4r::fix_ssl_error()
  }
  invisible(os)
}

#' has not conda
#'
#' Check if there is a conda, and uninstall if it does exist.
#'
#' @import conda4r
#' @export
has_not_conda <- function(){
  os <- conda4r::get_os()
  if (conda4r::conda_available()) {
    conda4r::remove_conda(os)
  }
  invisible(os)
}
