test_that("rowsums_draws works with basic draws_array", {
  # Create a simple draws_array using named arguments
  x <- posterior::draws_array(
    var_1 = c(1, 2, 3, 4),
    var_2 = c(5, 6, 7, 8),
    var_3 = c(9, 10, 11, 12),
    .nchains = 2
  )

  result <- rowsums_draws(x)

  # Check that result is a draws_array
  expect_s3_class(result, "draws_array")

  # Check dimensions - should have same iterations and chains, but only 1 variable (sum)
  expect_equal(dim(result), c(2, 2, 1))

  # Check that variable name is "sum"
  expect_equal(posterior::variables(result), "sum")

  # Check that number of chains is preserved
  expect_equal(posterior::nchains(result), posterior::nchains(x))

  # Check actual values - manually calculate expected sums
  expected_sums <- array(c(15, 18, 21, 24), dim = c(2, 2, 1))
  expect_equal(matrix(result[,,1], nrow = 2, ncol = 2), expected_sums[,,1])
})

test_that("rowsums_draws preserves chain structure", {
  # Test with different number of chains
  x <- posterior::draws_array(
    param1 = c(1, 2, 3, 4, 5, 6),
    param2 = c(7, 8, 9, 10, 11, 12),
    .nchains = 3
  )

  result <- rowsums_draws(x)

  expect_equal(posterior::nchains(result), 3)
  expect_equal(posterior::nchains(result), posterior::nchains(x))
})

test_that("rowsums_draws works with single variable", {
  x <- posterior::draws_array(
    single_var = c(1, 2, 3, 4),
    .nchains = 2
  )

  result <- rowsums_draws(x)

  expect_s3_class(result, "draws_array")
  expect_equal(dim(result), c(2, 2, 1))
  expect_equal(posterior::variables(result), "sum")

  # With single variable, rowsums should equal original values
  dimnames(result)$variable <- NULL
  dimnames(x)$variable <- NULL
  expect_equal(as.array(result)[,,1], as.array(x)[,,1])
})

test_that("rowsums_draws works with draws_matrix input", {
  # Test that function can handle draws_matrix input
  x_matrix <- posterior::draws_matrix(
    var_1 = c(1, 2, 3, 4),
    var_2 = c(5, 6, 7, 8),
    var_3 = c(9, 10, 11, 12)
  )

  result <- rowsums_draws(x_matrix)

  expect_s3_class(result, "draws_array")
  expect_equal(posterior::variables(result), "sum")
  expect_equal(posterior::nchains(result), posterior::nchains(x_matrix))
})

test_that("rowsums_draws works with draws_df input", {
  # Test that function can handle draws_df input
  x_df <- posterior::draws_df(
    var_1 = c(1, 2, 3, 4),
    var_2 = c(5, 6, 7, 8),
    var_3 = c(9, 10, 11, 12),
    .chain = c(1, 1, 2, 2),
    .iteration = c(1, 2, 1, 2),
    .draw = 1:4
  )

  result <- rowsums_draws(x_df)

  expect_s3_class(result, "draws_array")
  expect_equal(posterior::variables(result), "sum")
  expect_equal(posterior::nchains(result), posterior::nchains(x_df))
})

test_that("rowsums_draws handles missing values correctly", {
  x <- posterior::draws_array(
    var1 = c(1, 2),
    var2 = c(NA, 4),
    var3 = c(5, 6)
  )

  result <- rowsums_draws(x)

  expect_s3_class(result, "draws_array")
  # Check that NA is handled appropriately by rowSums
  expect_true(is.na(as.array(result)[1, 1, 1]))
  expect_equal(as.numeric(as.array(result)[2, 1, 1]), 12) # 2 + 4 + 6
})

test_that("rowsums_draws maintains draw order", {
  x <- posterior::draws_array(
    param_a = c(10, 20),
    param_b = c(100, 200)
  )

  result <- rowsums_draws(x)

  # First iteration should sum to 110, second to 220
  expect_equal(as.numeric(as.array(result)[1, 1, 1]), 110)
  expect_equal(as.numeric(as.array(result)[2, 1, 1]), 220)
})

test_that("rowsums_draws works with named variables", {
  x <- posterior::draws_array(
    alpha = c(1, 2),
    beta = c(3, 4),
    gamma = c(5, 6)
  )

  result <- rowsums_draws(x)

  expect_equal(posterior::variables(result), "sum")
  expect_equal(as.numeric(as.array(result)[1, 1, 1]), 1 + 3 + 5) # First iteration sum
  expect_equal(as.numeric(as.array(result)[2, 1, 1]), 2 + 4 + 6) # Second iteration sum
})

test_that("rowsums_draws error handling", {
  # Test with invalid input
  expect_error(rowsums_draws("not_a_draws_object"))
  expect_error(rowsums_draws(NULL))
  expect_error(rowsums_draws(list()))
})
