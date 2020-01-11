dependency <- function(os){
  UseMethod("dependency")
}

dependency.default <- function(os){
  stop("no method for ", class(os)[1L])
}

dependency.Windowsx86 <- function(os){
  invisible(os)
}

dependency.Windowsx64 <- function(os){
  invisible(os)
}

dependency.Darwinx64 <- function(os){
  invisible(os)
}

dependency.Linuxx64 <- function(os){
  sys::exec_wait("apt-get", args = "update")
  sys::exec_wait("apt-get", args = c("install","-y","bzip2"))
}
