has_conda <- function(restart_session = T){
  if(!conda_available()){
    install_conda()
  }
  if (restart_session && rstudioapi::hasFun("restartSession"))
    rstudioapi::restartSession()
  invisible(NULL)
}


