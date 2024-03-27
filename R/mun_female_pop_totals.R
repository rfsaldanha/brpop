#' Municipality yearly female population estimates totals
#'
#' This function provides a tibble containing female population estimates for Brazilian municipalities totals.
#'
#' @param source character. `bmh` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [bmh_mun_female_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_female_pop_totals <- function(){
  # Estimates source
  if(source == "bmh"){
    mun_female_pop <- brpop::bmh_mun_female_pop
  } else if(source == "ufrn"){
    mun_female_pop <- brpop::ufrn_mun_female_pop
  }

  res <- mun_female_pop %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$mun, .data$year)

  return(res)
}
