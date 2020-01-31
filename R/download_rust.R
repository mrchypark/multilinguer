#' rust installer download
#'
#' @param os Type of OS
#' @param dest where to download
#' @importFrom utils download.file
#' @export
rs_download <- function(os, dest) {
  UseMethod("rs_download")
}

rs_download.default <- function(os) {
  stop("no method for ", class(os)[1L])
}

rs_download.Windowsx86 <- function(os, dest = rs_dest_loc()) {
  tar <-
    "https://static.rust-lang.org/rustup/dist/i686-pc-windows-gnu/rustup-init.exe"
  download.file(tar, destfile = dest, mode = "wb")
}

rs_download.Windowsx64 <- function(os, dest = rs_dest_loc()) {
  tar <-
    "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-gnu/rustup-init.exe"
  download.file(tar, destfile = dest, mode = "wb")
}

rs_download.Darwinx64 <- function(os, dest = rs_dest_loc()) {
  tar <-
    "https://static.rust-lang.org/rustup/dist/x86_64-apple-darwin/rustup-init"
  download.file(tar, destfile = dest)
}

rs_download.Linuxx64 <- function(os, dest = rs_dest_loc()) {
  tar <-
    "https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init"
  download.file(tar, destfile = dest)
}

rs_download.Linuxx86 <- function(os, dest = rs_dest_loc()) {
  tar <-
    "https://static.rust-lang.org/rustup/dist/i686-unknown-linux-gnu/rustup-init"
  download.file(tar, destfile = dest)
}

#' @importFrom fs path path_temp path_home
rs_dest_loc <- function() {
  os <- get_os()
  return(switch(
    class(os),
    Windowsx86 = fs::path(fs::path_temp(), "rustup-init.exe"),
    Windowsx64 = fs::path(fs::path_temp(), "rustup-init.exe"),
    Darwinx64 = fs::path(fs::path_temp(), "rustup-init.sh"),
    Linuxx86 = fs::path(fs::path_temp(), "rustup-init.sh"),
    Linuxx64 = fs::path(fs::path_temp(), "rustup-init.sh"),
    message("not support os yet")
  ))
}

#' Install Rust
#'
#' @export
#' @rdname rustup
#' @importFrom sys exec_wait
#' @param targets which compiler targets would you like to install
#' @examples
#' \dontrun{
#' rust_uninstall()
#' rustup_windows()
#' }
rustup_windows <- function(targets) {
  mypath <- Sys.getenv('PATH')
  if (!grepl('\\.cargo[\\/]bin', mypath)) {
    user <- Sys.getenv('USERPROFILE')
    newpath <- paste0(user, "\\.cargo\\bin;", mypath)
    Sys.setenv(PATH = newpath)
  }
  if (!nchar(Sys.which('rustup'))) {
    init <- file.path(tempdir(), 'rustup-init.exe')
    utils::download.file('https://win.rustup.rs/',
                         destfile = init,
                         mode = 'wb')

    if (sys::exec_wait(init, c('-y', '--default-host', 'x86_64-pc-windows-gnu')))
      stop("Failed to run rustup-init")
  } else {
    if (sys::exec_wait('rustup', c('update', 'stable')))
      stop("Failed to run 'rustup update stable'")
  }
  info <- sys::exec_internal('rustup', 'show')
  for (x in targets) {
    if (!grepl(x, rawToChar(info$stdout))) {
      if (sys::exec_wait('rustup', c('target', 'add', x)))
        stop("Failed to run rustup target add")
    }
  }
  sys::exec_wait('rustup', 'show')
}

#' @export
#' @rdname rustup
rust_uninstall <- function() {
  user <- Sys.getenv('userprofile')
  cargo <-
    normalizePath(file.path(user, '.cargo'), mustWork = FALSE)
  rustup <-
    normalizePath(file.path(user, '.rustup'), mustWork = FALSE)
  Sys.setenv(PATH = paste0(cargo, "\\bin;", Sys.getenv('PATH')))
  if (nchar(Sys.which('rustup')))
    sys::exec_wait('rustup', c('self', 'uninstall', '-y'))
  if (file.exists(cargo))
    sys::exec_wait('cmd', c('/C', 'rmdir', cargo, '/S', '/Q'))
  if (file.exists(rustup))
    sys::exec_wait('cmd', c('/C', 'rmdir', rustup, '/S', '/Q'))
}
