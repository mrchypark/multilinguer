test_that("internal Java check function", {
  print(multilinguer:::check_java())
  expect_visible(multilinguer:::check_java())
})

test_that("internal conda check function", {
  print(multilinguer:::check_conda())
  expect_visible(multilinguer:::check_conda())
})
