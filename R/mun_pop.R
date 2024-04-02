#' Municipality yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian municipalities per age groups.
#'
#' @param source character. `bmh` for Brazilian Health Ministry estimates, `ufrn` for UFRN-DEM-LEPP estimates, `avg` for an average between both.
#'
#' @returns A tibble.
#' @seealso [bmh_mun_male_pop], [bmh_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_pop <- function(source = "bmh"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("bmh", "ufrn", "avg"))

  # Estimates source
  if(source == "bmh"){
    mun_male_pop <- brpop::bmh_mun_male_pop
    mun_female_pop <- brpop::bmh_mun_female_pop
  } else if(source == "ufrn"){
    mun_male_pop <- brpop::ufrn_mun_male_pop
    mun_female_pop <- brpop::ufrn_mun_female_pop
  }

  res <- dplyr::bind_rows(mun_male_pop, mun_female_pop) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$mun, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$mun, .data$year, .data$age_group, .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
