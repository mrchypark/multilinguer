#' check posible if not, install it
#'
#' @param what java or python. No defualt.
#' @export
set <- function(what) {
  switch(what,
         java = set_java(),
         python = set_python())
}

#' check posible java if not, install it
#' @export
set_java <- function() {
  if (check_rJava()) {
    message("rJava works!")
  } else {
    install("java")
  }
}

set_python <- function() {
  return(1)
}
