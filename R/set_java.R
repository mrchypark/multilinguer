setx <- function(key = "", value = "") {
  sys::exec_wait("setx", args = c(key, value), std_out = F)
}

set_java_home <- function(path = "") {
  if (grepl("Windows", get_os())) {
    winsetjavahome(path)
  } else if (grepl("Linux", get_os())) {
    linuxsetjavahome()
  }
}

#' @importFrom usethis write_union
#' @importFrom fs path path_home dir_ls
linuxsetjavahome <- function(path = "") {
  if (path == "") {
    path <- fs::dir_ls(crt_path())
  }
  usethis::write_union(fs::path(fs::path_home(), ".profile"), paste0("export JAVA_HOME=", path))
  usethis::write_union(fs::path(fs::path_home(), ".profile"), paste0("export JRE_HOME=", path, "/jre"))
  usethis::write_union(fs::path(fs::path_home(), ".profile"), paste0("export PATH=$PATH:", path,"/bin"))
  Sys.setenv("JAVA_HOME" = paste0(path))
  Sys.setenv("JRE_HOME" = paste0(path,"/jre"))
  Sys.setenv("PATH" = paste0("$PATH:", path,"/bin"))
}

#' @importFrom usethis write_union
#' @importFrom fs path dir_ls
winsetjavahome <- function(path = "") {
  if (path == "") {
    path <- fs::dir_ls(crt_path())
  }
  res <- setx("JAVA_HOME", path)
  Sys.setenv("JAVA_HOME" = path)
  paths <- paste0("%JAVA_HOME%\\bin;", Sys.getenv("path"))
  paths <- unique(strsplit(paths, ";")[[1]])
  paths <- paths[nchar(paths) > 0]
  paths <- paste0(paths, collapse = ";")
  res <- setx("path", paths)
  Sys.setenv("PATH" = paths)
}


crt_path <- function() {
  if (grepl("Darwin", get_os())) {
    fs::path("/Library/Java/JavaVirtualMachines/")
  } else {
    if (is_ascii(fs::path_home())) {
      fs::path(fs::path_home(), ".corretto")
    } else {
      fs::path("c://multilinguer/.corretto")
    }

  }
}

## copy from xfun package
is_ascii <- function(x) {
  out = !is.na(iconv(x, to = "ascii"))
  out[is.na(x)] = NA
  out
}
