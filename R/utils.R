get_os <- function(){
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if (grepl("x86", bits) & grepl("64", bits)) {
    bits <- "x64"
  }
  class(os) <- paste0(Sys.info()["sysname"], as.character(bits))
  return(os)
}

#' check if possible to find conda
#'
#' this function depends on find_conda() from reticulate package.
#' if find_conda() return NULL, conda_available() return FALSE.
#'
#' @export
conda_available <- function(){
  !is.null(reticulate:::find_conda())
}

conda_loc <- function(){
  return(fs::path(fs::path_home(), "Miniconda3"))
}

#' @importFrom fs path_split path_join
conda_root <- function(){
  path <- fs::path_split(reticulate:::find_conda())[[1]]
  path <- path[1:(length(path)-2)]
  return(fs::path_join(path))
}

conda_uninstall_binary <- function(){
  fs::path(multilinguer:::conda_root(), "Uninstall-Miniconda3.exe")
}

#' fix ssl error on conda
#'
#' Solution of this \href{https://github.com/conda/conda/issues/8273}{issue}
#'
#' @param loc location of conda
#' @importFrom fs dir_ls path file_copy
#' @importFrom tibble enframe
#' @importFrom dplyr filter transmute
#' @importFrom stringr str_detect str_replace
#' @export
fix_ssl_error <- function(loc = conda_root()){
  value <- from <- to <- NULL
  fs::dir_ls(fs::path(loc, "Library","bin")) %>%
    tibble::enframe(name=NULL) %>%
    dplyr::filter(stringr::str_detect(value, "ssl|libcrypto")) %>%
    dplyr::transmute(from = value,
                     to = stringr::str_replace(from,
                                      fs::path("Library","bin"),
                                      fs::path("DLLs"))) %>%
    with(fs::file_copy(from, to, overwrite = T))
}
