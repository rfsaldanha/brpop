#' UF yearly female population estimates totals
#'
#' This function provides a tibble containing female population estimates for Brazilian UFs ("Unidades Federativas") totals.
#'
#' @param source character. `datasus` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [datasus_mun_female_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_female_pop_totals <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn"))

  # Estimates source
  if(source == "datasus"){
    mun_female_pop <- brpop::datasus_mun_female_pop
  } else if(source == "ufrn"){
    mun_female_pop <- brpop::ufrn_mun_female_pop
  }

  res <- mun_female_pop %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::mutate(uf = substr(.data$mun, 0, 2)) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$uf, .data$year) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$uf, .data$year, .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
