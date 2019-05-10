test_that("internal rJava check function", {
  testthat::expect_false(multilinguer:::check_rJava())
})


test_that("internal conda check function", {
  testthat::expect_false(multilinguer:::check_conda())
})
