#' remove
#' @export
remove <- function(what) {
  os <- get("os", envir = .mlgrEnv)
  switch(what,
         java = remove_corretto(os),
         python = remove_anaconda(os)
  )
}

remove_corretto <- function(os){
  UseMethod("remove_corretto")
}

remove_corretto.Windowsx86 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip"
  print("windows 32bit!")
}

remove_corretto.Windowsx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip"
  download.file(down_path, destfile = "aws_jdk.zip",  mode = 'wb')
  unzip("aws_jdk.zip", exdir = "c://java")
  rmdone <- file.remove("aws_jdk.zip")
}

remove_corretto.Darwinx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}

remove_corretto.Linuxx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz"
  print("linux!")
}

remove_anaconda <- function(os){
  UseMethod("remove_anaconda")
}

remove_anaconda.Windowsx86 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip"
  print("windows 32bit!")
}

#' importFrom xml2 read_html html_nodes
#' importFrom rvest html_nodes html_attr
remove_anaconda.Windowsx64 <- function(os) {
  # tar <- "https://docs.aws.amazon.com/corretto/latest/corretto-8-ug/windows-7-install.html"
  # read_html(tar) %>% html_nodes("a") %>% html_attr("href") %>% grep("msi",.,value = T) -> down_path
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip"
  # download.file(down_path, destfile = "Amazon-Corretto-preview-8u192.msi",  mode = 'wb')
  # shell("Amazon-Corretto-preview-8u192.msi")
  print("windows 64bit!")
}

remove_anaconda.Darwinx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}

remove_anaconda.Linuxx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz"
  print("linux!")
}
