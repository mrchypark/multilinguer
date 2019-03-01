uncorretto <- function(os) {
  switch(
    class(os),
    Windowsx86 = utils::unzip,
    Windowsx64 = utils::unzip,
    Darwinx64 = function(tarfile, exdir, ...) {
      utils::untar(tarfile = tarfile,
                   exdir = exdir,
                   compressed = "gzip",
                   ...)
    },
    Linuxx64 = function(tarfile, exdir, ...) {
      utils::untar(tarfile = tarfile,
                   exdir = exdir,
                   compressed = "gzip",
                   ...)
    }
  )
}
