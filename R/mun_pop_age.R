#' Municipality yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian municipalities per age groups.
#'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#' @param sex character. `all` for all population, `male` for male population, `female` for female population. Defaults for `all`.
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [datasus_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_pop_age <- function(source = "datasus", sex = "all") {
  # Assertions
  checkmate::assert_choice(
    x = source,
    choices = c("datasus", "ufrn", "datasus2024")
  )
  checkmate::assert_choice(x = sex, choices = c("all", "female", "male"))

  # Estimates source
  if (source == "datasus") {
    mun_male_pop <- datasus_mun_male_pop()
    mun_female_pop <- datasus_mun_female_pop()
  } else if (source == "ufrn") {
    mun_male_pop <- ufrn_mun_male_pop()
    mun_female_pop <- ufrn_mun_female_pop()
  } else if (source == "datasus2024") {
    mun_male_pop <- datasus2024_mun_male_pop()
    mun_female_pop <- datasus2024_mun_female_pop()
  }

  if (any(is.null(mun_male_pop), is.null(mun_female_pop))) {
    return(NULL)
  }

  # All population or by sex
  if (sex == "all") {
    res <- dplyr::bind_rows(mun_male_pop, mun_female_pop)
  } else if (sex == "male") {
    res <- mun_male_pop
  } else if (sex == "female") {
    res <- mun_female_pop
  }

  # Summarise
  res <- res %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$code_muni, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$code_muni, .data$year, .data$age_group, .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
