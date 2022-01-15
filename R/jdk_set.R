setx <- function(key = "", value = "") {
  sys::exec_wait("setx", args = c(key, value), std_out = F)
}

unset <- function(key) {
  sys::exec_wait("REG", args = c("delete", "HKCU\\Environment", "/F", "/V", key), std_out = F)
}

set_java_home <- function(path = jdk_path()) {
  if (grepl("Windows", get_os())) {
    set_javahome_win(path)
  } else if (grepl("Linux", get_os())) {
    set_javahome_linux(path)
  }
}

#' @importFrom usethis write_union
#' @importFrom fs path path_home dir_ls
set_javahome_linux <- function(path = jdk_path()) {
  # usethis::ui_todo("Add .profile file to {usethis::ui_path('export PATH=$PATH:{{path}}')}")
}

#' @importFrom usethis write_union
#' @importFrom fs path dir_ls
set_javahome_win <- function(path = jdk_path()) {
  res <- setx("JAVA_HOME", path)
  Sys.setenv("JAVA_HOME" = path)
  paths <- paste0("%JAVA_HOME%/bin;", Sys.getenv("path"))
  paths <- unique(strsplit(paths, ";")[[1]])
  paths <- paths[nchar(paths) > 0]
  paths <- paste0(paths, collapse = ";")
  res <- setx("path", paths)
  Sys.setenv("PATH" = paths)
}

unset_javahome_win <- function(){
  unset("JAVA_HOME")
}


## copy from xfun package
is_ascii <- function(x) {
  out = !is.na(iconv(x, to = "ascii"))
  out[is.na(x)] = NA
  out
}
