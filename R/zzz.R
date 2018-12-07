.installjavaEnv <- new.env()

.onLoad <- function(libname, pkgname) {
  os <- "os_class"
  class(os) <- as.character(Sys.info()["sysname"])
  assign("os", os, envir = .installjavaEnv)
}

