#' Install Miniconda
#'
#' @details
#' Download the [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
#' installer, and use it to install Miniconda.
#' All function and descriptions from [reticulate package](https://github.com/rstudio/reticulate/blob/master/R/miniconda.R)
#'
#' @param path The path in which Miniconda will be installed. Note that the
#'   installer does not support paths containing spaces.
#' @param update Boolean; update to the latest version of Miniconda after install?
#' @param force Boolean; force re-installation if Miniconda is already installed
#'   at the requested path?
#' @export
install_miniconda <- function(path = "",
                              update = TRUE,
                              force = FALSE){
  if (!check_package("reticulate")) {
    stop("Please install reticulate package and try again.")
  }
  if (path == "") {
    path <- reticulate::miniconda_path()
  }
  reticulate::install_miniconda(path = path,
                                update = update,
                                force = force)
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
#' }
#' @export
install_java <- function(){
    os <-  get_os()
    dest <- crt_dest_loc()
    crt_download(os, dest)
    loc <- crt_path(os)
    crt_unc(os, dest, exdir = loc)
    set_java_home(os)
    post_process("install.packages('rJava', type = 'binary');library(rJava);.jinit();rstudioapi::restartSession()")
}

#' @rdname install_java
#' @export
#' @rdname install_java
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
