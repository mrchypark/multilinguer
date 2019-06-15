down <- function(os){
  UseMethod("down")
}

down.Windowsx86 <- function(){

}





conda_loc <- function(){
  return(fs::path(fs::path_home(), "Miniconda3"))
}
#' fix ssl error on conda
#'
#' Solution of this \link[=https://github.com/conda/conda/issues/8273]{issue}
#'
#' @param loc location of conda
#' @importFrom fs dir_ls path file_copy
#' @importFrom tibble enframe
#' @importFrom dplyr filter transmute
#' @importFrom stringr str_detect str_replace
#' @export
fix_ssl_error <- function(loc = conda_loc()){
  fs::dir_ls(fs::path(loc, "Library","bin")) %>%
    tibble::enframe(name=NULL) %>%
    dplyr::filter(str_detect(value, "ssl|libcrypto")) %>%
    dplyr::transmute(from = value,
                     to = str_replace(from,
                                      fs::path("Library","bin"),
                                      fs::path("DLLs"))) %$%
    fs::file_copy(from, to)
}
