#' Municipality yearly female population estimates per age group from 2000 to 2021
#'
#' A dataset containing female population estimates for Brazilian municipalities by age group from 2000 to 2021.
#'
#' The estimates were computed by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' \describe{
#'   \item{code_muni}{municipality 6 digits code}
#'   \item{year}{year of the estimate}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimate}
#' }
#' @export
datasus_mun_female_pop <- function() {
  .zenodo_data("datasus_mun_female_pop.rds")
}
