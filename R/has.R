#' has conda
#'
#' Check if there is a conda, and install if it does not exist.
#'
#' @param update defualt is T with conda update.
#' @param silent defualt is T.
#' @param quiet defualt is F.
#' @import conda4r
#' @export
has_conda <- function(update = TRUE, silent = T, quiet = F){
  if (!conda4r::conda_available()) {
    conda4r::install_conda(silent = silent, quiet = quiet)
  } else {
    return(TRUE)
  }
  if (grepl("Windows", class(get_os()))) {
    if (!quiet) cat("Fix windows conda ssl issue\n")
    conda4r::fix_ssl_error()
  }
  if (update){
    if (!quiet) cat("Update conda\n")
    conda4r::update_conda()
  }
}


#' has java
#'
#' Check if there is a java, and install if it does not exist.
#'
#' @import correttor
#' @export
has_java <- function(){
  if (!correttor::java_available()) {
    correttor::install_correttor()
  } else {
    return(TRUE)
  }
}
