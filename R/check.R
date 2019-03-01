#' @importFrom rJava .jinit
check_rJava <- function(){
  err <- try(rJava::.jinit(), silent = T)
  if (class(err) == "try-error") {
    return(F)
  } else {
    return(T)
  }
}
