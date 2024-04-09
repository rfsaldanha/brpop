#' UF yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian UFs ("Unidades Federativas") per age groups.
#'
#' @param source character. `datasus` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [datasus_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_pop_age <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn"))

  # Estimates source
  if(source == "datasus"){
    mun_male_pop <- brpop::datasus_mun_male_pop
    mun_female_pop <- brpop::datasus_mun_female_pop
  } else if(source == "ufrn"){
    mun_male_pop <- brpop::ufrn_mun_male_pop
    mun_female_pop <- brpop::ufrn_mun_female_pop
  }

  res <- dplyr::bind_rows(mun_male_pop, mun_female_pop) %>%
    dplyr::mutate(uf = substr(.data$code_muni, 0, 2)) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$uf, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$uf, .data$year, .data$age_group, .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
