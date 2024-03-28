#' Health region yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian health regions per age groups.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `bmh` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_pop <- function(type = "standard", source = "bmh"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("bmh", "ufrn"))

  res <- dplyr::bind_rows(regsaude_male_pop(type = type, source = source),
                          regsaude_female_pop(type = type, source = source)) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$regsaude, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::arrange(.data$regsaude, .data$year, .data$age_group) %>%
    tibble::as_tibble()

  return(res)
}
