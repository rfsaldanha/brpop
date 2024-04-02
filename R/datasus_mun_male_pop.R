#' Municipality yearly male population estimates per age group from 2000 to 2021
#'
#' A dataset containing male population estimates for Brazilian municipalities per age groups from 2000 to 2021.
#'
#' The estimates were computed by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' \describe{
#'   \item{code_muni}{municipality 6 digits code}
#'   \item{year}{year of the estimative}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimative}
#' }
"datasus_mun_male_pop"
