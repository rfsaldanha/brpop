#' UF yearly female population estimates totals
#'
#' This function provides a tibble containing female population estimates for Brazilian UFs ("Unidades Federativas") totals from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' \describe{
#'   \item{uf}{UF 2 digits code}
#'   \item{year}{year of the estimative}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [uf_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_female_pop_totals <- function(){
res <- brpop::uf_female_pop %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$uf, .data$year)

  return(res)
}
