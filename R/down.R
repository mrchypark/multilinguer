corretto_down <- function(os, destfile) {
  switch(
    class(os),
    Windowsx86 = download.file(
      url = "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip",
      destfile = destfile,
      quiet = T,
      mode = "wb"
    ),
    Windowsx64 = download.file(
      url = "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip",
      destfile = destfile,
      quiet = T,
      mode = "wb"
    ),
    Darwinx64 = download.file(
      url = "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz",
      quiet = T,
      destfile = destfile
    ),
    Linuxx64 = download.file(
      url = "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz",
      quiet = T,
      destfile = destfile
    )
  )
}

anaconda_path <- function(os) {
  switch(
    class(os),
    Windowsx86 = "",
    Windowsx64 = "",
    Darwinx64 = "",
    Linuxx64 = ""
  )
}

