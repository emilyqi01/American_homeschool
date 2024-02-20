library(testthat)
library(dplyr)

# Sample data for testing
df <- data.frame(
  state = c('State1', 'State1', 'State2', 'State2'),
  year = c(2000, 2001, 2000, 2001),
  population = c(1000000, 1005000, 505000, 500000)
)

# Expected output for basic growth calculation
expected_output <- data.frame(
  state = c('State1', 'State2'),
  year = c(2001, 2001),
  population = c(1005000, 505000),
  growth = c(5000, -5000),
  proportion = c(0.5, -5000 * 100/ 505000 ),
  abs_growth = c(0.5, 5000 * 100/ 505000 )
)

# Test that the growth proportion is calculated correctly
# need to check both positive and negative growth rate
test_that("Growth proportion is calculated correctly", {
  result <- calculate_growth_proportion(df, 'state', 'year', 'population')
  # The result should match the expected output, within a small numerical tolerance
  expect_equal(result$growth, expected_output$growth)
  expect_equal(result$proportion, expected_output$proportion, tolerance = 1e-9)
  expect_equal(result$abs_growth, expected_output$abs_growth, tolerance = 1e-9)
})

# Test to ensure that the function handles states with no growth
test_that("Function handles states with no growth", {
  no_growth_df <- data.frame(
    state = c('State3', 'State3'),
    year = c(2000, 2001),
    population = c(1000000, 1000000)
  )
  result <- calculate_growth_proportion(no_growth_df, 'state', 'year', 'population')
  # Expected growth and proportion(which is the growth rate) should be 0 for no growth
  expect_equal(result$growth[1], 0)
  expect_equal(result$proportion[1], 0)
})

# Test to ensure the function returns NA for states with only one year of data
test_that("Function returns NA for states with a single year of data", {
  single_year_df <- data.frame(
    state = c('State4'),
    year = c(2000),
    population = c(1000000)
  )
  result <- calculate_growth_proportion(single_year_df, 'state', 'year', 'population')
  # The result should be empty since there's no second year to calculate growth
  expect_equal(nrow(result), 0)
})

