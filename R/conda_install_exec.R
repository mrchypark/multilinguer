install_exec <- function(os, ...){
  UseMethod("install_exec")
}

install_exec.default <- function(os, ...){
  stop("no method for ", class(os)[1L])
}

install_exec.Windowsx86 <- function(os, dest, silent = silent){
  if (silent) {
    pid <- sys::exec_wait(dest, args = c("/InstallationType=JustMe",
                                         "/RegisterPython=0", "/S", "/D=", path))
  } else {
    pid <- sys::exec_wait(dest)
  }
}


install_exec.Windowsx64 <- function(os, dest, path, silent = silent){
  if (silent) {
    pid <- sys::exec_wait(dest, args = c("/InstallationType=JustMe",
                                         "/RegisterPython=0", "/S", "/D=", path))
  } else {
    pid <- sys::exec_wait(dest)
  }
}


install_exec.Darwinx64 <- function(os, dest, path, silent = silent){
  sys::exec_wait("bash", args = c(dest, "-b", "-p", path))
}

install_exec.Linuxx64 <- function(os, dest, path, silent = silent){
  sys::exec_wait("bash", args = c(dest, "-b", "-p", path))
}
