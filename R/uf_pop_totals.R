#' UF yearly population estimates totals
#'
#' This function provides a tibble containing population estimates for Brazilian UFs ("Unidades Federativas") totals from 2000 to 2021.
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
#' @seealso [uf_male_pop], [uf_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_pop_totals <- function(){
res <- dplyr::bind_rows(brpop::uf_male_pop, brpop::uf_female_pop) %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::group_by(.data$uf, .data$year) %>%
    dplyr::summarise(pop = sum(.data$pop)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$uf, .data$year)

  return(res)
}
