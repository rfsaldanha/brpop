#' UF yearly male population estimates totals
#'
#' This function provides a tibble containing male population estimates for Brazilian UFs ("Unidades Federativas") totals.
#'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [ufrn_mun_male_pop].
#'
#' @importFrom rlang .data
#' @export

uf_male_pop_totals <- function(source = "datasus") {
  # Assertions
  checkmate::assert_choice(
    x = source,
    choices = c("datasus", "ufrn", "datasus2024")
  )

  # Estimates source
  if (source == "datasus") {
    mun_male_pop <- datasus_mun_male_pop()
  } else if (source == "ufrn") {
    mun_male_pop <- ufrn_mun_male_pop()
  } else if (source == "datasus2024") {
    mun_male_pop <- datasus2024_mun_male_pop()
  }

  if (is.null(mun_male_pop)) {
    return(NULL)
  }

  res <- mun_male_pop %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::mutate(uf = substr(.data$code_muni, 0, 2)) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$uf, .data$year) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$uf, .data$year, .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
