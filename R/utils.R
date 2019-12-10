get_os <- function(){
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if (grepl("x86", bits) & grepl("64", bits)) {
    bits <- "x64"
  }
  class(os) <- paste0(Sys.info()["sysname"], as.character(bits))
  return(os)
}

system_sudo <- function(password, command){
  cmd <- paste0("echo ", password," | sudo -S ", command)
  system(cmd, ignore.stderr = T)
}

system_sudo_chk <- function(password, command){
  cmd <- paste0("echo ", password," | sudo -S ", command)
  system(cmd, ignore.stderr = T)
}

is_rstudio <- function() {
  (Sys.getenv("RSTUDIO") == "1") && !nzchar(Sys.getenv("RSTUDIO_TERM"))
}

#' @importFrom rstudioapi restartSession
post_process <- function(command) {
  if (is_rstudio()) {
    rstudioapi::restartSession(command)
  } else {
     message(paste0(
       "Please run command below in R console after restart session.\n",
       command
     ))
  }
}

check_package <- function(package_name) {
  pack <- fs::dir_ls(.libPaths())
  pack <- unique(sapply(strsplit(pack, "/"), function(x) x[length(x)]))
  package_name %in% pack
}
