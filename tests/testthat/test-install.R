test_that("install java and check", {
  install_jdk()
  testthat::expect_true(java_available())
})
