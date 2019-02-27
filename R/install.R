#' install
#' @export
java <- function() {
  os <- get("os", envir = .mlgrEnv)
  corretto(os)
}

corretto <- function(os){
  UseMethod("corretto")
}

corretto.Windowsx86 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip"
  print("windows 32bit!")
}

#' importFrom xml2 read_html html_nodes
#' importFrom rvest html_nodes html_attr
corretto.Windowsx64 <- function(os) {
  # tar <- "https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/windows-7-install.html"
  # read_html(tar) %>% html_nodes("a") %>% html_attr("href") %>% grep("msi",.,value = T) -> down_path
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip"
  # download.file(down_path, destfile = "Amazon-Corretto-preview-8u192.msi",  mode = 'wb')
  # shell("Amazon-Corretto-preview-8u192.msi")
  print("windows 64bit!")
}

corretto.Darwinx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}

corretto.Linuxx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz"
  print("linux!")
}




#' install
#' @export
python <- function() {
  os <- get("os", envir = .mlgrEnv)
  anaconda(os)
}

anaconda <- function(os){
  UseMethod("anaconda")
}

anaconda.Windowsx86 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip"
  print("windows 32bit!")
}

#' importFrom xml2 read_html html_nodes
#' importFrom rvest html_nodes html_attr
anaconda.Windowsx64 <- function(os) {
  # tar <- "https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/windows-7-install.html"
  # read_html(tar) %>% html_nodes("a") %>% html_attr("href") %>% grep("msi",.,value = T) -> down_path
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip"
  # download.file(down_path, destfile = "Amazon-Corretto-preview-8u192.msi",  mode = 'wb')
  # shell("Amazon-Corretto-preview-8u192.msi")
  print("windows 64bit!")
}

anaconda.Darwinx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}

anaconda.Linuxx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz"
  print("linux!")
}
