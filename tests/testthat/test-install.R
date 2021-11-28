test_that("install java and check", {
  install_jdk()
  install.packages("rJava", repos = "https://cloud.r-project.org")
  expect_silent(rJava::.jinit())
})
