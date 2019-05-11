install_rJava_binary <- function() {
  options(install.packages.check.source = "no")
  utils::install.packages(
    "rJava",
    quiet = T,
    dependencies = T,
    repos = "https://cloud.r-project.org/")
  options(install.packages.check.source = NULL)
}

check_java <- function() {
  os <- get("os", envir = .mlgrEnv)
  print(os)
  if (os == "Darwinx64") {
   ## Mac bypass
    return(F)
  } else {
    tryCatch({
      rJava:::.check.JVM()
    },
    error = function(e) {
      install_rJava_binary()
    },
    finally = {
      rJava:::.check.JVM()
    },
    silent = T)
  }
}

#' @importFrom reticulate conda_list
check_conda <- function() {
  err <- try(reticulate::conda_list(), silent = T)
  !(class(err) == "try-error")
}
