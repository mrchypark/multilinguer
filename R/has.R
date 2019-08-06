#' has conda
#'
#' Check if there is a conda, and install if it does not exist.
#'
#' @param update defualt is T with conda update.
#' @import conda4r
#' @export
has_conda <- function(update = FALSE){
  if (!conda4r::conda_available()) {
    conda4r::install_conda()
  } else {
    return(TRUE)
  }
  if (grepl("Windows", osVersion)) {
    conda4r::fix_ssl_error()
  }
  if (update){
    conda4r::update_conda()
  }
}

#' has not conda
#'
#' Check if there is a conda, and uninstall if it does exist.
#'
#' @import conda4r
# has_not_conda <- function(){
#   os <- get_os()
#   if (conda4r::conda_available()) {
#     conda4r::remove_conda(os)
#   }
#   invisible(os)
# }


