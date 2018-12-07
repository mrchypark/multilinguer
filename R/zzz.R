.correttorEnv <- new.env()

.onLoad <- function(libname, pkgname) {
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if(bits == "x86-64") {
    bits <- "x64"
  }

  class(os) <- c(Sys.info()["sysname"],as.character(bits))
  assign("os", os, envir = .correttorEnv)
}

