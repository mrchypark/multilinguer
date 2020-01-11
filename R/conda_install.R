#' install conda
#'
#' Defualt is Miniconda3. Other options are not this package scope.
#'
#' @param path installation path. Defualt is userhome/Miniconda3
#' @param silent silent installation with Justme, add PATH options. Defualt is TRUE.
#' @param quiet print step or not. Defualt is FALSE.
#'
#' @importFrom fs file_delete
#'
#' @export
conda_install <- function(path = conda_loc(),
                          silent = T,
                          quiet = F) {
  os <- get_os()
  dest <- conda_dest_loc(os)
  path <- conda_loc()

  dependency(os)

  if (!quiet) cat("Download conda\n")
  down_conda(os, dest, quiet)

  if (!quiet) cat("Install conda\n")
  install_exec(os, dest, path, silent)

  fs::file_delete(dest)
  if (!quiet) cat("Installation complete\n")
}
