#' Municipality yearly female population estimates totals
#'
#' This function provides a tibble containing female population estimates for Brazilian municipalities totals.
#'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#'
#' @returns A tibble.
#' @seealso [datasus_mun_female_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_female_pop_totals <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "datasus2024"))

  # Estimates source
  if(source == "datasus"){
    mun_female_pop <- datasus_mun_female_pop()
  } else if(source == "ufrn"){
    mun_female_pop <- ufrn_mun_female_pop()
  } else if (source == "datasus2024"){
    mun_female_pop <- datasus2024_mun_female_pop()
  }

  res <- mun_female_pop %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$code_muni, .data$year)

  return(res)
}
