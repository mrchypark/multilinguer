#' java available check
#'
#' @export
#' @importFrom sys exec_wait
#' @examples
#'  java_available()
java_available <- function() {
  if (grepl("Darwin", get_os())) {
    sys::exec_wait("/usr/libexec/java_home",
                   "-V",
                   std_out = F,
                   std_err = F) == 0
  } else {
    system("java -version") == 0
  }
}

java_ok_message <- function() {
  message("java available!")
  message("if you want to reinstall, with `force = TRUE`.")
  message("JAVA_HOME=", Sys.getenv("JAVA_HOME"))
}
