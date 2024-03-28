#' Health region yearly female population estimates per age group
#'
#' This function provides a tibble containing female population estimates for Brazilian health regions per age groups.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `bmh` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [bmh_mun_female_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_female_pop <- function(type = "standard", source = "bmh"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("bmh", "ufrn"))

  # Estimates source
  if(source == "bmh"){
    mun_female_pop <- brpop::bmh_mun_female_pop
  } else if(source == "ufrn"){
    mun_female_pop <- brpop::ufrn_mun_female_pop %>%
      dplyr::mutate(mun = as.numeric(substr(.data$mun, 0, 6)))
  }

  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  if(type == "standard"){
    res <- dplyr::left_join(mun_female_pop, brpop::mun_reg_saude, by = c("mun" = "cod_mun"))
  } else if(type == "reg_saude_449"){
    res <- dplyr::left_join(mun_female_pop, brpop::mun_reg_saude_449, by = c("mun" = "cod_mun"))
  }

  res <- dtplyr::lazy_dt(x = res) %>%
    dplyr::group_by(regsaude = .data$cod_reg_saude, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    tibble::as_tibble()

  return(res)
}
