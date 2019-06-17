#' has conda
#'
#' Check if there is a conda, and install if it does not exist.
#'
#' @return logical. TRUE maeans machine has conda.
#' @export
has_conda <- function(){
  if (!conda_available()) {
    install_conda()
  }
  if (grepl("Windows", class(os))) {
    fix_ssl_error()
  }
  conda_available()
}


