library(testthat)
library(dplyr)

# Sample data to test the calculate_cagr function
sample_data <- tibble(
  lea_id = c("A", "A", "B", "B"),
  homeschool_students = c(100, 121, 150, 180),
  year = c(2018, 2020, 2018, 2020)
)

# Test 1: Test that CAGR is calculated correctly
test_that("CAGR is calculated correctly", {
  result <- calculate_cagr(sample_data, "lea_id", "homeschool_students", "year")
  # Assuming a CAGR calculation with the formula ((end_value / start_value)^(1 / period) - 1) * 100
  # For "A", CAGR = ((121 / 100)^(1 / 2) - 1) * 100 = 10
  # For "B", CAGR = ((180 / 150)^(1 / 2) - 1) * 100 = 9.54
  expected <- tibble(
    lea_id = c("A", "B"),
    start_value = c(100, 150),
    end_value = c(121, 180),
    period = c(2, 2),
    cagr = c(10, 9.54)
  )
  expect_equal(result, expected, tolerance = 0.01)
})

# Test 2: Test that function handles cases with no growth (0% CAGR)
test_that("CAGR is 0% for no growth", {
  no_growth_data <- tibble(
    lea_id = c("C"),
    homeschool_students = c(100, 100),
    year = c(2018, 2020)
  )
  result <- calculate_cagr(no_growth_data, "lea_id", "homeschool_students", "year")
  expected <- tibble(
    lea_id = c("C"),
    start_value = c(100),
    end_value = c(100),
    period = c(2),
    cagr = c(0)
  )
  expect_equal(result, expected)
})

# Test 3: Test that function returns NA for groups with only one time point
test_that("CAGR is NA for groups with a single time point", {
  single_data <- tibble(
    lea_id = c("D"),
    homeschool_students = c(100),
    year = c(2018)
  )
  result <- calculate_cagr(single_data, "lea_id", "homeschool_students", "year")
  expect_true(is.na(result$cagr[1]))
})
