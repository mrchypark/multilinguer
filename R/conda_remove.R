remove_conda <- function(os, ...){
  UseMethod("remove_conda")
}

remove_conda.default <- function(os, ...){
  stop("no method for ", class(os)[1L])
}

remove_conda.Windowsx86 <- function(os, dest = conda_uninstall_binary()) {
  pid <- sys::exec_wait(dest)
}

remove_conda.Windowsx64 <- function(os, dest = conda_uninstall_binary()) {
  pid <- sys::exec_wait(dest)
}
