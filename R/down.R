corretto_down <- function(os, destfile) {
  switch(
    class(os),
    Windowsx86 = download.file(
      "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x86-jdk.zip",
      destfile = destfile,
      mode = "wb"
    ),
    Windowsx64 = download.file(
      "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-windows-x64-jdk.zip",
      destfile = destfile,
      mode = "wb"
    ),
    Darwinx64 = download.file(
      "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-macosx-x64.tar.gz",
      destfile = destfile
    ),
    Linuxx64 = download.file(
      "https://d2znqt9b1bc64u.cloudfront.net/amazon-corretto-8.202.08.2-linux-x64.tar.gz",
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

