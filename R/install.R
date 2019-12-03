#' install conda
#'
#' install miniconda
#'
# install_miniconda <- function(path = "",
#                               update = TRUE,
#                               force = FALSE){
#   if (packageVersion("reticulate")) {
#   }
#   install.packages("reticulate")
#   if (path == "") {
#     path <- reticulate::miniconda_path()
#   }
#   reticulate::install_miniconda(path = path,
#                                 update = update,
#                                 force = force)
# }


#' install `java`
#'
#' install `corretto` which is one of openjdk(java) distro.
#' Case of `MacOS`, remove all java and reinstall corretto version 11.
#'
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
