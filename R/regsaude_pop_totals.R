#' Health region yearly population estimates totals
#'
#' This function provides a tibble containing population estimates for Brazilian health regions totals.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `bmh` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_pop_totals <- function(type = "standard", source = "bmh"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("bmh", "ufrn"))

  res <- dplyr::bind_rows(regsaude_male_pop_totals(type = type, source = source),
                          regsaude_female_pop_totals(type = type, source = source)) %>%
    dtplyr::lazy_dt() %>%
    dplyr::group_by(.data$regsaude, .data$year) %>%
    dplyr::summarise(pop = sum(.data$pop)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$regsaude, .data$year) %>%
    tibble::as_tibble()

  return(res)
}
