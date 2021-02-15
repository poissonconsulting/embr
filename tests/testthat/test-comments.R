test_that("rm_comments", {
  expect_identical(rm_comments("y # x"), "y")
  expect_identical(rm_comments("y\n\n # x"), "y")
  expect_identical(rm_comments("y\n\n .# x"), "y\n\n .")
})
