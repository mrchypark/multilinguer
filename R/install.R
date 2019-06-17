#' install conda
#'
#' Defualt is Miniconda3. Other options are not this package scope.
#'
#' @param path installation path. Defualt is userhome/Miniconda3
#' @param silent silent installation with Justme, add PATH options. Defualt is TRUE.
#'
#' @importFrom fs file_delete
#' @importFrom rstudioapi restartSession hasFun
#'
#' @export
install_conda <- function(path = conda_loc(),
                          silent = T) {
  os <- get_os()
  dest <- conda_dest_loc(os)
  path <- conda_loc()

  dependency(os)

  cat("Download Conda.\n")
  down_conda(os, dest)

  cat("Install Conda.\n")
  exec_conda(os, dest, path, silent)

  fs::file_delete(dest)
  cat("Installation complete.\n")
}
