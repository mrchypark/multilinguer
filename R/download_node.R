#' nodejs installer download
#'
#' @param os Type of OS
#' @param dest where to download
#' @importFrom utils download.file
#' @export
node_download <- function(os, dest) {
  UseMethod("node_download")
}

node_download.default <- function(os) {
  stop("no method for ", class(os)[1L])
}


#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes html_attr
download_link_node <- function(version = c("lts", "current")) {
  version <- match.arg(version)
  switch (version,
          "lts" = {
            tar <- "https://nodejs.org/en/download/"
          },
          "current" = {
            tar <- "https://nodejs.org/en/download/current/"
          })
  hobj <- xml2::read_html(tar)
  tnodes <- rvest::html_nodes(hobj, "a")
  links <- rvest::html_attr(tnodes, "href")
  dists <- grep("dist", links, value = T)
  return(dists)
}

#' @importFrom fs path path_temp path_home
node_dest_loc <- function() {
  os <- get_os()
  return(switch(
    class(os),
    Windowsx64 = fs::path(fs::path_temp(), "node.zip"),
    Windowsx64 = fs::path(fs::path_temp(), "node.zip"),
    Darwinx64 = fs::path(fs::path_temp(), "node.tar.gz"),
    message("not support os yet")
  ))
}
