test_that("internal rJava check function", {
  print(multilinguer:::check_rJava())
  testthat::expect_success(multilinguer:::check_rJava())
})


test_that("internal conda check function", {
  print(multilinguer:::check_conda())
  testthat::expect_success(multilinguer:::check_conda())
})
