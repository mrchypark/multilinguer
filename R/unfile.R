uncorretto <- function(os) {
  switch(
    class(os),
    Windowsx86 = utils::unzip,
    Windowsx64 = utils::unzip,
    Darwinx64 = function(tarfile, exdir, ...){utils::untar(tarfile, exdir, compressed = "gzip")},
    Linuxx64 = "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz"
  )
}
