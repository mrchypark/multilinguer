#' install
#' @export
install <- function() {
  os <- get("os", envir = .correttorEnv)
  inst(os)
}

inst <- function(os){
  UseMethod("inst")
}

inst.Windowsx86 <- function(os) {
  print("32 bits system is not support now.")
}

inst.macosx86 <- function(os) {
  print("32 bits system is not support now.")
}

#' importFrom xml2 read_html
#' importFrom rvest html_nodes html_attr
inst.Windowsx64 <- function(os) {
  # tar <- "https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/windows-7-install.html"
  # read_html(tar) %>% html_nodes("a") %>% html_attr("href") %>% grep("msi",.,value = T) -> down_path
  down_path <- "https://d3pxv6yz143wms.cloudfront.net/Amazon-Corretto-preview-8u192.msi"
  # download.file(down_path, destfile = "Amazon-Corretto-preview-8u192.msi",  mode = 'wb')
  # shell("Amazon-Corretto-preview-8u192.msi")
  print("windows!")
}

inst.macosx64 <- function(os) {
  # tar <- "https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/macos-install.html"
  # read_html(tar) %>% html_nodes("a") %>% html_attr("href") %>% grep("msi",.,value = T) -> down_path
  down_path <- "https://d3pxv6yz143wms.cloudfront.net/corretto-jdk-8u192-macosx-x64.pkg"

  print("mac!")
}
