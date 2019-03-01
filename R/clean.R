#' clean remove java or python from multilinguer package
#'
#' @param what java or python. No defualt.
#' @export
clean <- function(what) {
  os <- get("os", envir = .mlgrEnv)
  switch(what,
         java = clean_corretto(os),
         python = clean_anaconda(os)
  )
}

remove_corretto <- function(os){

}

remove_anaconda <- function(os){
  UseMethod("remove_anaconda")
}

remove_anaconda.Windowsx86 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip"
  print("windows 32bit!")
}

remove_anaconda.Windowsx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip"
  print("windows 64bit!")
}

remove_anaconda.Darwinx64 <- function(os) {
  down_path <- "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}

