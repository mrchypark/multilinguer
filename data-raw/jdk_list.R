## code to prepare `jdk_data` dataset goes here

jdk_list <- yaml::read_yaml("inst/jdk.yaml")

usethis::use_data(jdk_list, overwrite = TRUE)
