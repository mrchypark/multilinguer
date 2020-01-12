#' corretto installer download
#'
#' windows x64 is for java11 x64
#' windows x86 is for java8 x86
#' mac is for java11 x64
#'
#' @param os Type of OS
#' @param dest where to download
#' @importFrom utils download.file
#' @export
crt_download <- function(os, dest){
  UseMethod("crt_download")
}

crt_download.default <- function(os){
  stop("no method for ", class(os)[1L])
}

crt_download.Windowsx86 <- function(os, dest = crt_dest_loc()){
  tar <- "https://corretto.aws/downloads/latest/amazon-corretto-8-x86-windows-jdk.zip"
  download.file(tar, destfile = dest, mode = "wb")
}

crt_download.Windowsx64 <- function(os, dest = crt_dest_loc()){
  tar <- "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-windows-jdk.zip"
  download.file(tar, destfile = dest, mode = "wb")
}

crt_download.Darwinx64 <- function(os, dest = crt_dest_loc()){
  tar <- "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.tar.gz"
  download.file(tar, destfile = dest)
}

crt_download.Linuxx64 <- function(os, dest = crt_dest_loc()){
  tar <- "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz"
  download.file(tar, destfile = dest)
}



#' @importFrom fs path path_temp path_home
crt_dest_loc <- function() {
  os <- get_os()
  return(switch(
    class(os),
    Windowsx86 = fs::path(fs::path_temp(), "crt.zip"),
    Windowsx64 = fs::path(fs::path_temp(), "crt.zip"),
    Darwinx64 = fs::path(fs::path_temp(), "crt.tar.gz"),
    Linuxx64 = fs::path(fs::path_temp(), "crt.tar.gz"),
    message("not support os yet")
  ))
}



