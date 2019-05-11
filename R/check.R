check_rJava <- function(){
  err <- try(requireNamespace("rJava", quietly = T), silent = T)
  ret <- !(class(err) == "try-error")
  if (ret) {
    unloadNamespace("rJava")
  }
  return(ret)
}

install_rJava_binary <- function() {
  options(install.packages.check.source = "no")
  install.packages("rJava", quiet = T, dependencies = T)
  options(install.packages.check.source = NULL)
}

check_java <- function(){
  err <- try(rJava::.jinit(), silent = T)
  !(class(err) == "try-error")
}

#' @importFrom reticulate conda_list
check_conda <- function() {
  err <- try(reticulate::conda_list(), silent = T)
  !(class(err) == "try-error")
}
