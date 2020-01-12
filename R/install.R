#' Install conda
#'
#' @details
#' Download the [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
#' installer, and use it to install Miniconda.
#' All function and descriptions from [reticulate package](https://github.com/rstudio/reticulate/blob/master/R/miniconda.R)
#'
#' @examples
#' \dontrun{
#'   install_conda()
#' }
#' @export
install_conda <- function() {
  message("Please install reticulate(>= 1.14) package and use install_miniconda() function.")
}

#' install `java`
#'
#' @description
#' install `corretto` which is one of openjdk(java) distro.
#' Case of `MacOS`, remove all java and reinstall `corretto` version 11.
#'
#' @examples
#' \dontrun{
#'   install_java()
#'   install_jdk()
#' }
#' @export
install_java <- function() {
  os <-  get_os()
  dest <- crt_dest_loc()
  crt_download(os, dest)
  loc <- crt_path(os)
  crt_unc(os, dest, exdir = loc)
  set_java_home(os)
  post_process(
    "install.packages('rJava', type = 'binary');library(rJava);.jinit();rstudioapi::restartSession()"
  )
}

#' @rdname install_java
#' @export
install_jdk <- install_java


install_nodejs <- function() {
  return(T)
}

install_go <- function() {
  return(T)
}

install_rust <- function() {
  return(T)
}
