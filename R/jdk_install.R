#' @export
install_jdk <- function(path = jdk_path(),
                        version = "11",
                        gui = TRUE,
                        run = "ask",
                        force = FALSE) {

  version <- as.character(version)
  run <- match.arg(tolower(run), c("ask", "yes", "no"))

  if (!interactive()) {
    if (run == "ask") {
      usethis::ui_stop("Use {usethis::ui_code('multilinguer::install_jdk(run = \"yes\")')} to run installation on non-interactive environment.")
    }
    gui <- FALSE
    usethis::ui_warn("gui parameter force change to FALSE on non-interactive environment.")
  }

  url <- jdk_installer_url(version, gui)

  if (run == "ask") {

    usethis::ui_info("Target JDK: {usethis::ui_field(basename(url))}")
    if (!gui) {
      usethis::ui_info("Files Path: {usethis::ui_path(jdk_path())}")
    }

    run <- "no"
    if (usethis::ui_yeah("Are you sure you want to install jdk?")) {
      run <- "yes"
    }
  }
  if (run == "no") {
    usethis::ui_info("Installation stop by user.")
    return()
  }

  install_jdk_preflight(path, force)

  # download the installer
  data("jdk_list")
  usethis::ui_info("Installing JDK -- please wait a moment ...")
  if (is.null(url))
    usethis::ui_stop("Unsupported. please check {usethis::ui_code('jdk_list')}.")
  installer <- jdk_installer_download(url)

  if (gui) {
    jdk_installer_run(installer)
    usethis::ui_info("Jdk has been successfully installed with gui installer.")
    # quit <- usethis::ui_yeah("Using jdk requires shutdown and restart rstudio or console. Are you sure you want to shutdown?")
    # if (quit)
    # ## https://stackoverflow.com/questions/38181415/how-to-non-interactively-quit-rstudio-gracefully#comment64998430_38181415
    #   if (is_windows())
    #     shell('taskkill /F /IM "rstudio.exe" /T ')
    #   if (is_unix())
    #     system('killall rstudio')
    # else
    #   usethis::ui_todo("Plase shutdown for apply the settings.")
    usethis::ui_todo("Plase all windows close and restart for apply the jdk setting.")
  } else {
    jdk_installer_unc(installer, path)
    usethis::ui_info("Jdk has been successfully installed at {usethis::ui_path(path)}")
    return(path)
  }
}

#' @export
remove_jdk <- function(path = jdk_path()) {
  unlink(path, recursive = TRUE)
  unset_javahome_win()
}

uninstall_jdk <- remove_jdk


jdk_installer_url <- function(version, gui) {
  data("jdk_list")
  url <- getOption("multilinguer.jdk.url")
  if (!is.null(url))
    return(url)

  is_interactive <- "interactive"
  if (!gui) {
    is_interactive <- "zip"
  }
  if (Sys.info()["sysname"] == "Linux") {
    is_interactive <- "zip"
  }

  jdk_list[[get_os()]][[version]][[is_interactive]]
}

jdk_installer_download <- function(url) {
  installer <- normalizePath(file.path(tempdir(), basename(url)), winslash = "/", mustWork = FALSE)
  if (file.exists(installer))
    return(installer)

  usethis::ui_info("Downloading {usethis::ui_path(url)}")
  status <- utils::download.file(url, destfile = installer, mode = "wb")
  if (!file.exists(installer)) {
    usethis::ui_stop("download of jdk faild. status: {usethis::ui_code(status)}")
  }

  installer
}

jdk_installer_run <- function(installer) {
  ext <- file_extension(installer)

  usethis::ui_info('Running {usethis::ui_field("installer")} and wait until done.')
  runner <- system
  if (ext == "msi") {
    runner <- shell
  }
  status <- runner(installer)
  status
}

jdk_installer_unc <- function(installer, path) {
  ext <- file_extension(installer)
  unc <- utils::untar
  if (ext == "zip") {
  unc <- utils::unzip
  }
  if (grepl("Darwin", get_os())) {
    unc <- jdk_unc_formac
  }

  unc(installer,  exdir = path)
  jdk_dir <- dir(jdk_path())
  path_set <- normalizePath(file.path(path, jdk_dir), winslash = "/", mustWork = FALSE)
  set_java_home(path_set)
}

jdk_path <- function() {
  Sys.getenv("MULTILINGUER_JDK_PATH", unset = jdk_path_default())
}

jdk_path_default <- function() {
  if (is_osx()) {
    return(path.expand("~/Library/Java/JavaVirtualMachines/"))
  }

  # otherwise, use rappdirs default
  root <- normalizePath(rappdirs::user_data_dir(), winslash = "/", mustWork = FALSE)
  file.path(root, "multilinuer-jdk")

}


install_jdk_preflight <- function(path, force) {
  if (force)
    return(invisible(TRUE))

  if (!file.exists(path))
    return(invisible(TRUE))

  if (jdk_available()) {

    usethis::ui_stop("JDK is already installed.
                      Use {usethis::ui_code('multilinguer::install_jdk(force = TRUE)')} to overwrite the previous installation.")
  }

  # ok to proceed
  invisible(TRUE)

}
