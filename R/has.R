has_conda <- function(){
  if(!conda_available()){
    install_conda()
  }
}


