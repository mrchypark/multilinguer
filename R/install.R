#' install conda
#'
#' Check if there is a conda, and install if it does not exist.
#'
#' @param force force installation. Defualt is FALSE
#' @param update defualt is T with conda update.
#' @param silent defualt is T.
#' @param quiet defualt is F.
#' @export
install_conda <- function(force = FALSE,
                      update = TRUE,
                      silent = TRUE,
                      quiet = FALSE){

  if (!conda_available() | force) {
    conda_install(silent = silent, quiet = quiet)
  } else {
    return(TRUE)
  }
  if (grepl("Windows", class(get_os()))) {
    if (!quiet) cat("Fix windows conda ssl issue\n")
    fix_ssl_error()
  }
  if (update) {
    if (!quiet) cat("Update conda\n")
    conda_update()
  }
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
