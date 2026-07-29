#' Health regions yearly population estimates per age group and sex
#'
#' This function combines male and female health-region estimates and includes
#' a variable named `sex`.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_sex_pop <- function(type = "standard", source = "datasus") {
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "datasus2024"))

  male <- regsaude_male_pop(type = type, source = source)
  female <- regsaude_female_pop(type = type, source = source)

  if (is.null(male) || is.null(female)) {
    return(NULL)
  }

  regsaude_male_pop <- male %>% dplyr::mutate(sex = "Male")
  regsaude_female_pop <- female %>% dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(regsaude_male_pop, regsaude_female_pop) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$codi_reg_saude, .data$year, .data$age_group, .data$sex) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$codi_reg_saude, .data$year, .data$age_group, .data$sex) %>%
    dplyr::relocate("sex", .after = "pop") %>%
    tibble::as_tibble()

  return(res)
}
