#' @importFrom askpass askpass
#' @importFrom fs path
jdk_unc_formac <- function(file_path, exdir, ...){
  pw <- askpass::askpass("Please enter your MacOS password for install java:")
  chk <- system_sudo_chk(pw, "echo") == 0
  while (!chk) {
    print("Incorrect Password.")
    pw <- askpass::askpass("Please enter EXACT MacOS password:")
    if (is.null(pw)) {
      break
    }
    chk <- system_sudo_chk(pw, "echo") == 0
  }

  system_sudo(pw, paste0("rm -rf ", exdir,"/*"))
  system_sudo(pw, paste0("tar -xvzf ", file_path, " -C ", exdir))

  from <- fs::path(exdir, dir(exdir))
  to <- fs::path(exdir, "jdk-11.0.1.jdk")

  system_sudo(pw, paste0("rm -rf ", to))
  system_sudo(pw, paste0("mv ", from, " ", to))
  system_sudo(pw, "R CMD javareconf")
}
