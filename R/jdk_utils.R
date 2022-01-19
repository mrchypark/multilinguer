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

#' @rdname java_available
#' @export
jdk_available <- java_available


