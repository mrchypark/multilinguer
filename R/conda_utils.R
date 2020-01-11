#' check if possible to find conda
#'
#' this function depends on find_conda() from reticulate package.
#' if find_conda() return NULL, conda_available() return FALSE.
#'
#' @importFrom reticulate conda_binary
#' @export
conda_available <- function(){
  tem <- try(reticulate::conda_binary("auto"), silent = T)
  return(ifelse(class(tem) == "try-error", F, T))
}

conda_loc <- function(){
  return(fs::path(fs::path_home(), "miniconda3"))
}

#' @importFrom fs path_split path_join
#' @importFrom reticulate conda_binary
conda_root <- function(){
  path <- fs::path_split(reticulate::conda_binary())[[1]]
  path <- path[1:(length(path)-2)]
  return(fs::path_join(path))
}

#' conda update
#'
#' @param conda conda binary location. Defualt is auto.
#' @importFrom reticulate conda_binary
#' @importFrom sys exec_wait
#' @export
update_conda <- function(conda = "auto"){
  conda <- reticulate::conda_binary(conda)
  res <- sys::exec_wait(conda, args = c("update","-y","-n","base","-c","defaults","conda"))
  invisible(res)
}

#' @importFrom fs path
conda_uninstall_binary <- function(){
  fs::path(conda_root(), "Uninstall-Miniconda3.exe")
}

#' fix ssl error on conda
#'
#' Solution of this \href{https://github.com/conda/conda/issues/8273}{issue}
#'
#' @param loc location of conda
#' @importFrom fs dir_ls path file_copy
#' @export
fix_ssl_error <- function(loc = conda_root()){
  tar_path <- fs::dir_ls(fs::path(loc, "Library","bin"))
  from <- grep("ssl|libcrypto", tar_path, value = T)
  to <- gsub(fs::path("Library","bin"), fs::path("DLLs"), from)
  fs::file_copy(from, to, overwrite = T)
}
