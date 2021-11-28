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
download_corretto <- function(dest = "") {
  os <- get_os()
  dlmode <- "w"
  if (grepl("Window", os)) {
    if (grepl("64", os)) {
      tar <-
        "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-windows-jdk.zip"
    } else {
      tar <-
        "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-windows-jdk.zip"
    }
    dlmode <- "wb"
  } else if (grepl("Darwin", os)) {
    tar <-
      "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.tar.gz"
  } else if (grepl("Linux", os)) {
    tar <-
      "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz"
  } else {
    stop(paste0("Your OS not supported:", get_os()))
  }
  if (dest == "") {
    dest <- fs::path(fs::path_temp(), "corretto.z")
  }
  download.file(tar, destfile = dest, mode = dlmode)
  return(dest)
}

