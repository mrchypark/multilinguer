test_that("internal rJava check function", {
  print(multilinguer:::check_rJava())
  testthat::expect_visible(multilinguer:::check_rJava())
})


test_that("internal conda check function", {
  print(multilinguer:::check_conda())
  testthat::expect_visible(multilinguer:::check_conda())
})
