#' uncompress corretto source
#'
#' @param os system os
#' @param ... extra param
#' @export
crt_unc <- function(os, ...){
  UseMethod("crt_unc")
}

crt_unc.default <- function(os){
  stop("no method for ", class(os)[1L])
}

#' @importFrom zip unzip
crt_unc.Windowsx86 <- function(os, ...){
  zip::unzip(...)
}

crt_unc.Windowsx64 <- function(os, ...){
  zip::unzip(...)
}

#' @importFrom askpass askpass
#' @importFrom fs path
crt_unc.Darwinx64 <- function(os, file_path, exdir, ...){
  pw <- askpass::askpass("Please enter your MacOS password for install java:")
  chk <- system_sudo_chk(pw, "echo") == 0
  while (!chk) {
    print("Incorrect Password.")
    pw <- askpass::askpass("Please enter EXACT MacOS password:")
    if (is.null(pw)) {
      break
    }
    chk <- system_sudo_chk(pw, "echo") == 0
  }

  system_sudo(pw, paste0("rm -rf ", exdir,"/*"))
  system_sudo(pw, paste0("tar -xvzf ", file_path, " -C ", exdir))

  from <- fs::path(exdir, dir(exdir))
  to <- fs::path(exdir, "jdk-11.0.1.jdk")

  system_sudo(pw, paste0("rm -rf ", to))
  system_sudo(pw, paste0("mv ", from, " ", to))
  system_sudo(pw, "R CMD javareconf")
}
