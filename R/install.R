#' install
#'
#' @param what java or python. No defualt.
#' @export
install <- function(what) {
  switch(what,
         java = install_corretto(),
         python = install_anaconda())
}

#' @importFrom utils download.file unzip
#' @importFrom fs path path_temp path_home path_home_r file_delete
#' @importFrom rstudioapi restartSession
install_corretto <- function() {
  os <- get("os", envir = .mlgrEnv)
  temp_dir <- fs::dir_create(fs::file_temp())
  temp_dest <- fs::path(temp_dir,"jdk", ext = "zip")
  jdk_path <- fs::path(fs::path_home(),"mlrjdk")

  corretto_down(os, destfile = temp_dest)
  uz <- uncorretto(os)
  uzdone <- uz(temp_dest, exdir = jdk_path)
  rmdone <- fs::file_delete(temp_dest)

  path <- fs::dir_ls(jdk_path)
  env_text <- paste0("JAVA_HOME = ", path)
  env_f <- readLines(fs::path_home_r(".Renviron"))
  if (any(grepl("JAVA_HOME", env_f))) {
    env_f <- env_f[-grep("JAVA_HOME", env_f)]
  }
  env_f <- c(env_f, env_text)
  writeLines(env_f, fs::path_home_r(".Renviron"))
  rstudioapi::restartSession()
}

install_anaconda <- function(os) {
  UseMethod("install_anaconda")
}

install_anaconda.Windowsx86 <- function(os) {
  down_path <-
    "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip"
  print("windows 32bit!")
}

install_anaconda.Windowsx64 <- function(os) {
  down_path <-
    "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip"

  print("windows 64bit!")
}

install_anaconda.Darwinx64 <- function(os) {
  down_path <-
    "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}

install_anaconda.Linuxx64 <- function(os) {
  down_path <-
    "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz"
  print("linux!")
}
