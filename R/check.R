#' @importFrom rJava .jinit
check_rJava <- function(){
  err <- try(rJava::.jinit(), silent = T)
  if (class(err) == "try-error") {
    return(F)
  } else {
    return(T)
  }
}

#' @importFrom reticulate conda_list
check_conda <- function() {
  err <- try(reticulate::conda_list(), silent = T)
  if (class(err) == "try-error") {
    return(F)
  } else {
    return(T)
  }
}
