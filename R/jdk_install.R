#' Install `jdk`
#'
#' @description
#' Install `openjdk` which is one of openjdk(java) distro.
#' Case of `MacOS`, remove all java and reinstall `corretto` version 11.
#'
#' @param path String; The location where jdk is (or should be) installed. See
#'   [jdk_path] for more details on the default path used by `multilinguer`.
#' @param version String; Jdk version. Now only support "11". check inst/jdk.yaml.
#' @param gui Boolean; Some jdk supports os native installer. User can use
#'   the gui when in interactive mode and use `Windows` or `MacOS`.
#' @param run c("ask","yes","no");If set "yes", installation proccess start. Default is "ask" to user.
#' @param force Boolean; force install when is TRUE. Default is FALSE.
#' @examples
#' \dontrun{
#'   install_java()
#'   install_jdk()
#' }
#' @family jdk-installer
#' @importFrom usethis ui_stop ui_warn ui_info ui_field ui_path ui_yeah ui_todo
#' @export
install_jdk <- function(path = jdk_path(),
                        version = "11",
                        gui = TRUE,
                        run = "ask",
                        force = FALSE) {

  version <- as.character(version)
  run <- match.arg(tolower(run), c("ask", "yes", "no"))
  if (is_linux()) {
    gui <- FALSE
  }

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
  usethis::ui_info("Installing JDK -- please wait a moment ...")
  if (is.null(url))
    usethis::ui_stop("Unsupported. please check {usethis::ui_code('jdk_list')}.")
  installer <- jdk_installer_download(url, force)

  if (gui) {
    jdk_installer_run(installer)
    usethis::ui_info("Jdk has been successfully installed with gui installer.")

    if (grepl("Windows", get_os())) {
      usethis::ui_todo("Plase all windows close and restart for apply the jdk setting.")
    ## TODO: support quit behavior?
    ## quit_ask()
    }
  } else {
    jdk_installer_unc(installer, path)
    usethis::ui_done("Jdk has been successfully installed at {usethis::ui_path(path)}")
    if (is_windows()) {
      usethis::ui_todo("Plase all windows close and restart for apply the jdk setting.")
    } else if (is_linux()) {
      usethis::ui_todo("Need to set environment variable {usethis::ui_code('JAVA_HOME')} and {usethis::ui_code('PATH')} as {usethis::ui_field('ROOT')}.")
      usethis::ui_info("Add code below to profile file like {usethis::ui_field('/etc/profile')} or {usethis::ui_field('/etc/bashrc')} .")
      usethis::ui_code_block("export JAVA_HOME={path}
                              export PATH=$PATH:$JAVA_HOME/bin")
      usethis::ui_todo("After apply environment variables and RUN code below.")
      usethis::ui_code_block("sudo R CMD javareconf")
    }
    return(path)
  }
}

quit_ask <- function(){
  quit <- usethis::ui_yeah("Using jdk requires shutdown and restart rstudio or console. Are you sure you want to shutdown?")
  if (quit)
  ## https://stackoverflow.com/questions/38181415/how-to-non-interactively-quit-rstudio-gracefully#comment64998430_38181415
    if (is_windows())
      shell('taskkill /F /IM "rstudio.exe" /T ')
    if (is_unix())
      system('killall rstudio')
  else
    usethis::ui_todo("Plase shutdown for apply the settings.")
}

#' @rdname install_jdk
#' @family jdk-installer
#' @export
install_java <- install_jdk


#' Remove Jdk
#'
#' Uninstall jdk from this package.
#'
#' @param path The path in which jdk is installed.
#'
#' @examples
#' \dontrun{
#'   remove_jdk()
#'   uninstall_jdk()
#' }
#' @family jdk-installer
#' @export
remove_jdk <- function(path = jdk_path()) {
  unlink(path, recursive = TRUE)
  unset_javahome_win()
}

#' @rdname remove_jdk
#' @family jdk-installer
#' @export
uninstall_jdk <- remove_jdk


jdk_installer_url <- function(version, gui) {

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

jdk_installer_download <- function(url, force) {
  installer <- normalizePath(file.path(tempdir(), basename(url)), winslash = "/", mustWork = FALSE)
  if (file.exists(installer) & !force)
    return(installer)

  usethis::ui_info("Downloading {usethis::ui_path(url)}")
  status <- tryCatch(utils::download.file(url, destfile = installer, mode = "wb"), error = function(e) e, warning = function(w) w)
  if (status != 0) {
    unlink(installer)
    usethis::ui_stop("Download jdk installer failed. status: {usethis::ui_code(status)}")
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
  if (grepl("Darwin", get_os())) {
    runner <- mac_runner
  }
  status <- runner(installer)
  if (status != 0) {
    unlink(installer)
    usethis::ui_stop("Install jdk failed. status: {usethis::ui_code(status)}")
  }
}

mac_runner <- function(installer) {
  system(paste0("open ", installer))
  # pw <- ask_password()
  # system_sudo(pw, paste0("installer -pkg ", installer, " -target /Applications"))
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

  status <- unc(installer,  exdir = path)
  print(status)
  if (status != 0) {
    unlink(path)
    usethis::ui_stop("Uncompress jdk failed. status: {usethis::ui_code(status)}")
  }
  jdk_dir <- dir(jdk_path())
  path_set <- normalizePath(file.path(path, jdk_dir), winslash = "/", mustWork = FALSE)
  set_java_home(path_set)
}

#' jdk path
#'
#' The path to the Jdk installation to use. By default, an OS-specific
#' path is used. If you'd like to instead set your own path, you can set the
#' `MULTILINGUER_JDK_PATH` environment variable.
#'
#' You need to make sure you have permission when setting the path with `MULTILINGUER_JDK_PATH`.
#'
#' @family jdk-installer
#' @examples
#'   jdk_path()
#'
#' @export
jdk_path <- function() {
  Sys.getenv("MULTILINGUER_JDK_PATH", unset = jdk_path_default())
}

jdk_path_default <- function() {
  if (is_osx()) {
    return(path.expand("/Library/Java/JavaVirtualMachines/"))
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
