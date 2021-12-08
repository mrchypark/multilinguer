#' corretto installer download
#'
#' windows x64 is for java11 x64
#' windows x86 is for java8 x86
#' mac is for java11 x64
#' linux is for java11 x64
#'
#' @param dest target path and file name.
#' @importFrom utils download.file
#' @export
jdk_download <- function(dest = "") {
  os <- get_os()
  dlmode <- "w"

  switch(get_os(),
    "Windowsx86-64" = "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-windows-jdk.zip",
    "Windowsx86-32" = "https://corretto.aws/downloads/latest/amazon-corretto-11-x86-windows-jdk.zip",
    "Darwinarm64" = "https://cdn.azul.com/zulu/bin/zulu11.52.13-ca-jdk11.0.13-macosx_aarch64.tar.gz",
    "Darwinx86_64" = "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.tar.gz",
    "Linuxx86_64" = "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz",
    "Linuxx86_32" = "https://corretto.aws/downloads/latest/amazon-corretto-11-x86-linux-jdk.tar.gz",
    "Linuxarm64" = "https://corretto.aws/downloads/latest/amazon-corretto-11-aarch64-linux-jdk.tar.gz",
    "SunOSX86-64" = "https://cdn.azul.com/zulu/bin/zulu8.58.0.13-ca-jdk8.0.312-solaris_x64.zip",
    "SunOSi86pc" =
  ) -> tar

  if (grepl("Window", os)) {
    dlmode <- "wb"
  }

  if (dest == "") {
    path <- fs::path_temp()
    if (chk_dir_fine(path)) {
      dest <- fs::path(fs::path_temp(), "crt.z")
    } else {
      dir.create("c://multilinguer/")
      dest <- fs::path("c://multilinguer/crt.z")
    }
  }
  download.file(tar, destfile = dest, mode = dlmode)
  return(dest)
}

