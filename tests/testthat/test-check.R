test_that("conda check function", {
  expect_type(conda_available(), "logical")
})

test_that("test get os",{
  print(multilinguer:::get_os())
  expect_success(multilinguer:::get_os())
})

test_that("has test", {
  expect_false(conda_available())
  expect_invisible(has_conda())
})

test_that("has after test", {
  expect_true(conda_available())
})
