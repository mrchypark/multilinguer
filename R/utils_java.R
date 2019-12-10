#' java available check
#'
#' @importFrom sys exec_wait
#' @export
java_available <- function() {
  os <- class(get_os())
  switch(
    os,
    Darwinx64 = sys::exec_wait(
      "/usr/libexec/java_home",
      "-V",
      std_out = F,
      std_err = F
    ) == 0,
    Windowsx64 = system("java -version") == 0,
    Windowsx86 = system("java -version") == 0
  )
}

#' java home check
#'
#' @param os system os
#' @export
java_home_check <- function(os) {
  UseMethod("java_home_check")
}

java_home_check.Windowsx64 <- function(os) {
  Sys.getenv("JAVA_HOME") != ""
}

java_home_check.Windowsx86 <- java_home_check.Windowsx64

java_home_check.Darwinx64 <- function(os) {
  sys::exec_wait("/usr/libexec/java_home",
                 "-V",
                 std_out = F,
                 std_err = F) == 0
}
