exec_conda <- function(os, ...){
  UseMethod("exec_conda")
}

exec_conda.default <- function(os){
  stop("no method for ", class(os)[1L])
}

exec_conda.Windowsx86 <- function(os, silent = silent){
  if (silent) {
    pid <- sys::exec_wait(dest, args = c("/InstallationType=JustMe",
                                         "/RegisterPython=0", "/S", "/D=", path))
  } else {
    pid <- sys::exec_wait(dest)
  }
}

exec_conda.Windowsx64 <- function(os, silent = silent){
  if (silent) {
    pid <- sys::exec_wait(dest, args = c("/InstallationType=JustMe",
                                         "/RegisterPython=0", "/S", "/D=", path))
  } else {
    pid <- sys::exec_wait(dest)
  }
}

exec_conda.Darwin <- function(os, silent = silent){
# exec_conda.Darwinx64
}

exec_conda.Linuxx <- function(os, silent = silent){
# exec_conda.Linuxx64
}

