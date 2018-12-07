#' install
#' @export
install <- function(x, ...) {
  os <- get("os", envir = .installjavaEnv)
  inst(os)
}


inst <- function(x, ...){
  UseMethod("inst")
}

inst.x86 <- function(os) {
  print("32bit system not support now.")
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
