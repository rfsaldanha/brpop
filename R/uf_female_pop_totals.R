#' UF yearly female population estimates totals
#'
#' This function provides a tibble containing female population estimates for Brazilian UFs ("Unidades Federativas") totals from 2000 to 2021.
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
#' @seealso [uf_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_female_pop_totals <- function(){

  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  res <- brpop::uf_female_pop %>%
    dplyr::filter(age_group != "Total") %>%
    dplyr::group_by(.data$uf, .data$year) %>%
    multidplyr::partition(cluster) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$uf, .data$year, .data$pop)

  return(res)
}
