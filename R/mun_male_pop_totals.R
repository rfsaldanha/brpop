#' Municipality yearly male population estimates totals
#'
#' This function provides a tibble containing male population estimates for Brazilian municipalities totals.
#'
#' @param source character. `datasus` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [ufrn_mun_male_pop].
#'
#' @importFrom rlang .data
#' @export

mun_male_pop_totals <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn"))

  # Estimates source
  if(source == "datasus"){
    mun_male_pop <- brpop::datasus_mun_male_pop
  } else if(source == "ufrn"){
    mun_male_pop <- brpop::ufrn_mun_male_pop
  }

  res <- mun_male_pop %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$mun, .data$year)

  return(res)
}
