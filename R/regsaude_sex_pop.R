#' Health regions yearly population estimates per age group and sex
#'
#' This function binds UF male and female datasets (`uf_male_pop` and `uf_female_pop`), aggregates estimatives by health regions and includes a new variable called 'sex'.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_sex_pop <- function(type = "standard", source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "datasus2024"))

  regsaude_male_pop <- regsaude_male_pop(type = type, source = source) %>%
    dplyr::mutate(sex = "Male")
  regsaude_female_pop <- regsaude_female_pop(type = type, source = source) %>%
    dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(regsaude_male_pop, regsaude_female_pop) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$codi_reg_saude, .data$year, .data$age_group, .data$sex) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$codi_reg_saude, .data$year, .data$age_group, .data$sex) %>%
    dplyr::relocate(.data$sex, .after = .data$pop) %>%
    tibble::as_tibble()

  return(res)
}
