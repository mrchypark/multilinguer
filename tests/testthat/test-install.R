test_that("install java and check", {
  install_jdk()
  testthat::expect_true(java_available())
})

test_that("check os print", {
  testthat::expect_equal(multilinguer:::get_os(), "")
})
