#' install
#' @export
install <- function(x, ...) {
  os <- get("os", envir = .installjavaEnv)
  inst(os)
}


inst <- function(x, ...){
  UseMethod("inst")
}


inst.Windows <- function(os) {
  print("windows!")
}

inst.macos <- function(os) {
  print("mac!")
}

# inst.linux <- function() {
#
# }
