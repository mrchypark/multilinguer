#' install
#'
#' @param what java or python. No defualt.
#' @export
install <- function(what) {
  switch(what,
         java = install_corretto(),
         python = install_miniconda())
}

#' @importFrom utils download.file unzip
#' @importFrom fs path path_temp path_home path_home_r file_delete
#' @importFrom rstudioapi restartSession
install_corretto <- function() {
  os <- get("os", envir = .mlgrEnv)
  temp_dir <- fs::dir_create(fs::file_temp())
  temp_dest <- fs::path(temp_dir,"jdk", ext = "zip")
  jdk_dir <- fs::dir_create(fs::path(fs::path_home(),"mlrjdk"))
  jdk_path <- fs::path(fs::path_home(),"mlrjdk")

  corretto_down(os, destfile = temp_dest)
  uz <- uncorretto(os)
  uzdone <- uz(temp_dest, exdir = jdk_path)
  rmdone <- fs::file_delete(temp_dest)

  path <- fs::dir_ls(jdk_path)
  env_text <- paste0("JAVA_HOME = ", path)
  if (!fs::file_exists(fs::path_home_r(".Renviron"))) {
    env_cre <- fs::file_create(fs::path_home_r(".Renviron"))
  }
  env_f <- readLines(fs::path_home_r(".Renviron"))
  if (any(grepl("JAVA_HOME", env_f))) {
    env_f <- env_f[-grep("JAVA_HOME", env_f)]
  }
  env_f <- c(env_f, env_text)
  writeLines(env_f, fs::path_home_r(".Renviron"))
  if (rstudioapi::isAvailable()) {
    rstudioapi::restartSession()
  } else {
    message("Java installation is done. Please restart session.")
  }
}

install_miniconda <- function(os) {
  UseMethod("install_miniconda")
}

install_anaconda.Windowsx86 <- function(os) {
  down_path <-
    "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86.exe"
  print("windows 32bit!")
}

install_anaconda.Windowsx64 <- function(os, restart_session = TRUE) {
  down_path <-
    "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"
  tem_path <- fs::path_temp()
  download.file(down_path, destfile = fs::path(tem_path, "mc64.exe"), mode="wb")

  fs::dir_create(fs::path_home(), "Miniconda3")

  loc <- fs::path(fs::path_home(), "Miniconda3")

  pid <- sys::exec_background(fs::path(tem_path, "mc64.exe"),
                       args = c("/InstallationType=JustMe",
                       "/RegisterPython=0",
                       "/S",
                       "/D=", loc))

  fs::dir_ls(fs::path(loc, "Library","bin")) %>%
    tibble::enframe(name=NULL) %>%
    dplyr::filter(str_detect(value, "ssl|libcrypto")) %>%
    dplyr::transmute(from = value,
                  to = str_replace(from,
                                   fs::path("Library","bin"),
                                   fs::path("DLLs"))) %$%
  fs::file_copy(from, to)
  cat("\nInstallation complete.\n\n")
  if (restart_session && rstudioapi::hasFun("restartSession"))
    rstudioapi::restartSession()
  invisible(NULL)
}

install_anaconda.Darwinx64 <- function(os) {
  down_path <-
    "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz"

  print("mac!")
}
