#' Municipality yearly female population estimates per age group from BMH
#'
#' A dataset containing female population estimates for Brazilian municipalities per age groups from 2000 to 2021.
#'
#' The estimates were computed by DataSUS (Brazilian Ministry of Health - BMH), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' @format A tibble with 2,216,016 rows and 4 variables:
#' \describe{
#'   \item{mun}{municipality 6 digits code}
#'   \item{year}{year of the estimative}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimative}
#' }
"bmh_mun_female_pop"
