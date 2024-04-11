#' Municipality yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian municipalities per age groups.
#'
#' @param source character. `datasus` for Brazilian Health Ministry estimates, `ufrn` for UFRN-DEM-LEPP estimates, `avg` for an average between both.
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [datasus_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_pop_age <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "avg"))

  # Estimates source
  if(source == "datasus"){
    mun_male_pop <- datasus_mun_male_pop()
    mun_female_pop <- datasus_mun_female_pop()
  } else if(source == "ufrn"){
    mun_male_pop <- ufrn_mun_male_pop()
    mun_female_pop <- ufrn_mun_female_pop()
  }

  res <- dplyr::bind_rows(mun_male_pop, mun_female_pop) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$code_muni, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$code_muni, .data$year, .data$age_group, .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
