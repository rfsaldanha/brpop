#' Municipality yearly male population estimates per age group from 2000 to 2024
#'
#' A dataset containing male population estimates for Brazilian municipalities per age groups from 2000 to 2024.
#'
#' The estimates were computed by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' \describe{
#'   \item{code_muni}{municipality 6 digits code}
#'   \item{year}{year of the estimative}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimative}
#' }
datasus2024_mun_male_pop <- function(){
  path <- zendown::zen_file(deposit_id = zenodo_deposit, file_name = "datasus2024_mun_male_pop.rds")
  readRDS(file = path)
}
