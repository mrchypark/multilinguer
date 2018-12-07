#' install
#' @export
install <- function() {
  os <- get("os", envir = .correttorEnv)
  inst(os)
}

inst <- function(os){
  UseMethod("inst")
}

inst.Windowsx86 <- function(os) {
  print("32 bits system is not support now.")
}

inst.macosx86 <- function(os) {
  print("32 bits system is not support now.")
}

inst.Windowsx64 <- function(os) {
  print("windows!")
}

inst.macosx64 <- function(os) {
  print("mac!")
}

# inst.linux <- function() {
#
# }
