#' Health region yearly male population estimates totals
#'
#' This function provides a tibble containing male population estimates for Brazilian health regions totals.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_male_pop_totals <- function(type = "standard", source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "datasus2024"))

  res <- regsaude_male_pop(type = type, source = source) %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$codi_reg_saude, .data$year)

  return(res)
}
