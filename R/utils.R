get_os <- function(){
  return(paste0(Sys.info()["sysname"], Sys.info()["machine"]))
}

# from reticulate package
#####################################################
is_interactive <- function() {
  rstudio <- !is.na(Sys.getenv("RSTUDIO", unset = NA))
  gui <- .Platform$GUI
  if (rstudio && !identical(gui, "RStudio"))
    return(FALSE)
  interactive()
}

is_linux <- function() {
  identical(tolower(Sys.info()[["sysname"]]), "linux")
}

is_osx <- function() {
  Sys.info()["sysname"] == "Darwin"
}

is_r_cmd_check <- function() {
  not_cran <- Sys.getenv("NOT_CRAN", unset = NA)
  if (identical(not_cran, "true"))
    return(FALSE)
  package_name <- Sys.getenv("_R_CHECK_PACKAGE_NAME_",
                             unset = NA)
  if (!is.na(package_name))
    return(TRUE)
  FALSE
}

is_rstudio <- function() {
  exists("RStudio.Version", envir = globalenv())
}

is_rstudio_desktop <- function() {
  if (!exists("RStudio.Version", envir = globalenv()))
    return(FALSE)
  RStudio.Version <- get("RStudio.Version", envir = globalenv())
  version <- RStudio.Version()
  identical(version$mode, "desktop")
}

is_ubuntu <- function() {
  if (is_unix() && file.exists("/etc/lsb-release")) {
    lsbRelease <- readLines("/etc/lsb-release")
    any(grepl("Ubuntu", lsbRelease))
  }
  else {
    FALSE
  }
}

is_unix <- function() {
  identical(.Platform$OS.type, "unix")
}

is_windows <- function() {
  identical(.Platform$OS.type, "windows")
}
#####################################################



## command for macos
#################################
system_sudo <- function(password, command){
  cmd <- paste0("echo ", password," | sudo -S ", command)
  system(cmd, ignore.stderr = T)
}

system_sudo_chk <- function(password){
  cmd <- paste0("echo ", password," | sudo -S echo")
  system(cmd, ignore.stderr = T)
}

ask_password <- function(){
  pw <- askpass::askpass("Please enter your MacOS password for install java:")
  if (is.null(pw)) {
    usethis::ui_stop("User cancel on to enter password.")
  }
  chk <- system_sudo_chk(pw) == 0
  while (!chk) {
    print("Incorrect Password.")
    pw <- askpass::askpass("Please enter EXACT MacOS password:")
    if (is.null(pw)) {
      usethis::ui_stop("User cancel on to enter password.")
    }
    chk <- system_sudo_chk(pw) == 0
  }
  pw
}
#################################

#' @importFrom rstudioapi restartSession
post_process <- function(command) {
  if (is_rstudio()) {
    rstudioapi::restartSession(command)
  } else {
     message(paste0(
       "Please run command below in R console after restart session.\n",
       command
     ))
  }
}

chk_dir_fine <- function(path){
  res <- try(dir.create(path), silent = T)
  if (class(res) == "try-error") {
    return(FALSE)
  }
  return(TRUE)
}

check_package <- function(package_name) {
  pack <- fs::dir_ls(.libPaths())
  pack <- unique(sapply(strsplit(pack, "/"), function(x) x[length(x)]))
  package_name %in% pack
}

## https://stackoverflow.com/a/70670903
file_extension <- function(filenames) {
  sub(pattern = "^(.*\\.|[^.]+)(?=[^.]*)", replacement = "", filenames, perl = TRUE)
}

is_rstudio <- function() {
  exists("RStudio.Version", envir = globalenv())
}

is_rstudio_desktop <- function() {
  if (!exists("RStudio.Version", envir = globalenv()))
    return(FALSE)

  RStudio.Version <- get("RStudio.Version", envir = globalenv())
  version <- RStudio.Version()
  identical(version$mode, "desktop")
}
