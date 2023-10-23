#' UF yearly female population estimates per age group
#'
#' A dataset containing female population estimates for Brazilian UFs ("Unidades Federativas") per age groups from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' @format A tibble with 10,692 rows and 4 variables:
#' \describe{
#'   \item{uf}{UF 2 digits code}
#'   \item{year}{year of the estimative}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimative}
#' }
"uf_female_pop"
