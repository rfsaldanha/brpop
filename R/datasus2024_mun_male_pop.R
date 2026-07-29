#' Municipality yearly male population estimates per age group from 2000 to 2024
#'
#' A dataset containing male population estimates for Brazilian municipalities by age group from 2000 to 2024.
#'
#' The estimates were computed by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' \describe{
#'   \item{code_muni}{municipality 7 digits code}
#'   \item{year}{year of the estimate}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimate}
#' }
#' @export
datasus2024_mun_male_pop <- function() {
  .zenodo_data("datasus2024_mun_male_pop.rds")
}
