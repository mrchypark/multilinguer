has_conda <- function(){
  pkgbuild::has_build_tools()
  if(!conda_available()){
    install_conda()
  }
}
