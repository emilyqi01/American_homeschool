#' Calculate Growth Proportion for Population Data
#'
#' This function calculates the growth proportion of a population for each state
#' and year in the provided data frame.
#'
#' @param data_frame A data frame containing the population data.
#' @param state_col The name of the column in `data_frame` that contains state identifiers.
#' @param year_col The name of the column in `data_frame` that contains year values.
#' @param population_col The name of the column in `data_frame` that contains population figures.
#'
#' @return A data frame with the original data plus the calculated growth and proportional growth.
#'
#' @export
#'
#' @examples
#' example_df <- data.frame(
#'   state = c('State1', 'State1', 'State2', 'State2'),
#'   year = c(2000, 2001, 2000, 2001),
#'   population = c(1000000, 1005000, 500000, 505000)
#' )
#' calculate_growth_proportion(example_df, 'state', 'year', 'population')
calculate_growth_proportion <- function(data_frame, state_col, year_col, population_col) {
  # Sort the data to ensure correct order of years
  data_frame <- data_frame[order(data_frame[[state_col]], data_frame[[year_col]]), ]
  
  # Calculate population growth for each state each year
  data_frame <- data_frame %>%
    group_by(!!sym(state_col)) %>%
    mutate(
      growth = c(NA, diff(!!sym(population_col))),
      proportion = growth / lag(!!sym(population_col)),
      abs_growth = abs(proportion)
    )
  
  # Remove NA values (growth proportion cannot be calculated for the first year as there's no previous year data)
  return(data_frame[!is.na(data_frame$growth), ])
}
