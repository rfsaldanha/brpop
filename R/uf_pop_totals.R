#' UF yearly population estimates totals
#'
#' This function provides a tibble containing population estimates for Brazilian UFs ("Unidades Federativas") totals from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' \describe{
#'   \item{uf}{UF 2 digits code}
#'   \item{year}{year of the estimative}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [uf_male_pop], [uf_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_pop_totals <- function(){
res <- dplyr::bind_rows(brpop::uf_male_pop, brpop::uf_female_pop) %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$uf, .data$year)

  return(res)
}
