#' @importFrom askpass askpass
jdk_unc_formac <- function(file_path, exdir, ...){
  pw <- ask_password()
  system_sudo(pw, paste0("rm -rf ", exdir,"/*"))
  system_sudo(pw, paste0("tar -xvzf ", file_path, " -C ", exdir))

  from <-  file.path(exdir, dir(exdir))
  to <-  file.path(exdir, "jdk-11.0.1.jdk")

  system_sudo(pw, paste0("rm -rf ", to))
  system_sudo(pw, paste0("mv ", from, " ", to))
  system_sudo(pw, "R CMD javareconf")
}
