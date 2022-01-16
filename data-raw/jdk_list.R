## code to prepare `jdk_list` dataset goes here

jdk_list <- yaml::read_yaml("inst/jdk.yaml")

usethis::use_data(jdk_list, overwrite = TRUE, internal = TRUE)
