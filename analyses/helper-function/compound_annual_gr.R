#' Calculate Compound Annual Growth Rate (CAGR)
#'
#' This function computes the Compound Annual Growth Rate (CAGR) for a given
#' numeric value within groups identified by a unique identifier over a specified
#' time period. 
#'
#' @param data_frame A dataframe containing the data.
#' @param id_col A string with the name of the column that uniquely identifies each group.
#' @param value_col A string with the name of the column containing the numeric values for which CAGR will be calculated.
#' @param year_col A string with the name of the column containing the time period, typically years as numeric or character.
#'
#' @return A dataframe with each unique identifier from id_col and its corresponding CAGR value.
#' @export
#'
#' @examples
#' calculate_cagr(homeschool_update, "lea_id", "homeschool_students", "year")
calculate_cagr <- function(data_frame, id_col, value_col, year_col) {
  # Group by the ID column and calculate CAGR for each group
  cagr_df <- data_frame %>%
    group_by(!!sym(id_col)) %>%
    arrange(!!sym(year_col)) %>%
    summarise(
      start_value = first(!!sym(value_col)),
      end_value = last(!!sym(value_col)),
      period = max(!!sym(year_col)) - min(!!sym(year_col)),
      cagr = if_else(period > 0, ((end_value / start_value)^(1 / period) - 1) * 100, NA_real_)
    ) 
  return(cagr_df)
}
