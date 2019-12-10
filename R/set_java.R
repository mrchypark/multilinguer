set_java_home <- function(os, ...) {
  UseMethod("set_java_home")
}

set_java_home.default <- function(os) {
  stop("no method for ", class(os)[1L])
}

set_java_home.Darwinx64 <- function(os) {
  invisible(os)
}

#' @importFrom usethis write_union
#' @importFrom fs path path_home_r
set_java_home.Windowsx64 <- function(os, path = "") {
  if (path == "") {
    path <- fs::dir_ls(crt_path(os))[1]
  }
  if (length(path) == 0) {
    stop("There's empty. Please install java first.")
  }
  res <- setx("JAVA_HOME", path)
  paths <- paste0("%JAVA_HOME%\\bin;", Sys.getenv("path"))
  paths <- unique(strsplit(paths, ";")[[1]])
  paths <- paths[nchar(paths) > 0]
  paths <- paste0(paths, collapse = ";")
  res <- setx("path", paths)
  forenvron <- paste0('JAVA_HOME=', path)
  usethis::write_union(fs::path(fs::path_home_r(), "/", ext = "Renviron"), forenvron)
}

set_java_home.Windowsx86 <- set_java_home.Windowsx64

crt_path <- function(os) {
  UseMethod("crt_path")
}

crt_path.default <- function(os) {
  stop("no method for ", class(os)[1L])
}

crt_path.Windowsx86 <- function(os) {
  fs::path(fs::path_home(), "corretto")
}

crt_path.Windowsx64 <- function(os) {
  fs::path(fs::path_home(), "corretto")
}

crt_path.Darwinx64 <- function(os) {
  fs::path("/Library/Java/JavaVirtualMachines/")
}

setx <- function(key = "", value = "") {
  sys::exec_wait("setx", args = c(key, value), std_out = F)
}
