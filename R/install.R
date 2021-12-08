#' Install miniconda
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
  message("If you want to install with params, please use reticulate package diractly.")
  post_process("install.packages('reticulate');reticulate::install_miniconda()")
}

#' @rdname install_conda
#' @export
install_miniconda <- install_conda

#' install `java`
#'
#' @description
#' install `openjdk` which is one of openjdk(java) distro.
#' Case of `MacOS`, remove all java and reinstall `corretto` version 11.
#'
#'
#' @param force
#' @examples
#' \dontrun{
#'   install_java()
#'   install_jdk()
#' }
#' @export
install_java <- function(force = FALSE) {
  chk <- java_available()
  if (force) {
    chk <- FALSE
  }
  if (chk) {
    java_ok_message()
  } else {
    dest <- jdk_download()
    loc <- jdk_loc()
    message(paste("JDK will located at", loc))
    jdk_unc(dest, exdir = loc)
    set_java_home()
    message(paste("ENV will set"))
    message(paste("JAVA_HOME=", Sys.getenv("JAVA_HOME")))
    message(paste("PATH=", Sys.getenv("PATH")))
    post_process(
      "install.packages('rJava');library(rJava);.jinit();rstudioapi::restartSession()"
    )
  }
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
