.mlgrEnv <- new.env()

.onLoad <- function(libname, pkgname) {
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if (grepl("x86", bits) & grepl("64", bits)) {
    bits <- "x64"
  }
  class(os) <- paste0(Sys.info()["sysname"], as.character(bits))
  assign("os", os, envir = .mlgrEnv)
}

.onAttach <- function(libname, pkgname){
  os <- get("os", envir = .mlgrEnv)
  packageStartupMessage(paste0("Your os is ", os))
  packageStartupMessage("This package only support mac, win32, win64 for now.")
  packageStartupMessage("Please issue here https://github.com/mrchypark/multilinguer/issues.")
}
