install_conda <- function(path = conda_loc(),
                          force = FALSE,
                          restart_session = TRUE){



}

conda_available <- function(){
  !is.null(reticulate:::find_conda())
}



install_miniconda <- function(os) {
  UseMethod("install_miniconda")
}

install_anaconda.Windowsx86 <- function(os) {
  down_path <-
    "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86.exe"
  print("windows 32bit!")
}

has_conda <- function(){
  pkgbuild::has_build_tools
  reticulate::conda_binary()
}


install_miniconda <- function(restart_session = T) {
  down_path <-
    "https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"
  tem_path <- fs::path_temp()
  download.file(down_path, destfile = fs::path(tem_path, "mc.exe"), mode="wb")

  fs::dir_create(fs::path_home(), "Miniconda3")

  loc <- conda_loc()

  pid <- sys::exec_wait(fs::path(tem_path, "mc.exe"),
                       args = c("/InstallationType=JustMe",
                       "/RegisterPython=0",
                       "/S",
                       "/D=", loc))

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
