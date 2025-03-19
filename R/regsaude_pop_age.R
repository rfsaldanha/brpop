#' Health region yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian health regions per age groups.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#' @param sex character. `all` for all population, `male` for male population, `female` for female population. Defaults for `all`.
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_pop_age <- function(
  type = "standard",
  source = "datasus",
  sex = "all"
) {
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(
    x = source,
    choices = c("datasus", "ufrn", "datasus2024")
  )
  checkmate::assert_choice(x = sex, choices = c("all", "female", "male"))

  # All population or by sex
  if (sex == "all") {
    res <- dplyr::bind_rows(
      regsaude_male_pop(type = type, source = source),
      regsaude_female_pop(type = type, source = source)
    )
  } else if (sex == "male") {
    res <- regsaude_male_pop(type = type, source = source)
  } else if (sex == "female") {
    res <- regsaude_female_pop(type = type, source = source)
  }

  # Summarise
  res <- res %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$codi_reg_saude, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::arrange(.data$codi_reg_saude, .data$year, .data$age_group) %>%
    tibble::as_tibble()

  return(res)
}
