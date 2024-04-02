#' Municipality yearly population totals
#'
#' This function provides a tibble containing total population estimates for Brazilian municipalities.
#'
#' @param source character. `bmh` for Brazilian Health Ministry estimates (2000 to 2021), `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030), or `ibge` for IBGE estimates (2000 to 2022).
#'
#' @returns A tibble.
#' @seealso [bmh_mun_male_pop], [bmh_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop], [ibge_pop].
#'
#' @importFrom rlang .data
#' @export

mun_pop_totals <- function(source = "bmh"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("bmh", "ufrn", "ibge"))

  # Estimates source
  if(source == "bmh"){
    mun_male_pop <- brpop::bmh_mun_male_pop
    mun_female_pop <- brpop::bmh_mun_female_pop
  } else if(source == "ufrn"){
    mun_male_pop <- brpop::ufrn_mun_male_pop
    mun_female_pop <- brpop::ufrn_mun_female_pop
  }

  if(source == "bmh" | source == "ufrn"){
    res <- dplyr::bind_rows(mun_male_pop, mun_female_pop) %>%
      dplyr::filter(.data$age_group == "Total") %>%
      dtplyr::lazy_dt() %>%
      dplyr::group_by(.data$mun, .data$year) %>%
      dplyr::summarise(pop = sum(.data$pop)) %>%
      dplyr::ungroup() %>%
      dplyr::arrange(.data$mun, .data$year) %>%
      tibble::as_tibble()
  } else if(source == "ibge"){
    res <- ibge_pop
  }

  return(res)
}
