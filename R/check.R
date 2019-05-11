check_rJava <- function(){
  err <- try(requireNamespace("rJava", quietly = T), silent = T)
  ret <- !(class(err) == "try-error")
  if (ret) {
    unloadNamespace("rJava")
  }
  return(ret)
}

install_rJava <- function() {
  check_rJava()
}

#' @export
#' @importFrom rJava .jinit
check_java <- function(){
  err <- try(rJava::.jinit(), silent = T)
  !(class(err) == "try-error")
}

#' @export
#' @importFrom reticulate conda_list
check_conda <- function() {
  err <- try(reticulate::conda_list(), silent = T)
  !(class(err) == "try-error")
}
