#' UF yearly male population estimates per age group
#'
#' A dataset containing male population estimates for Brazilian UFs ("Unidades Federativas") per age groups from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' @format A tibble with 10,692 rows and 4 variables:
#' \describe{
#'   \item{uf}{UF 2 digits code}
#'   \item{year}{year of the estimative}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimative}
#' }
#' @source \url{http://tabnet.datasus.gov.br/cgi/deftohtm.exe?popsvs/cnv/popbr.def}
"uf_male_pop"
