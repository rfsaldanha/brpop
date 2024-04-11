#' Health region yearly female population estimates per age group
#'
#' This function provides a tibble containing female population estimates for Brazilian health regions per age groups.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `datasus` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [datasus_mun_female_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data

regsaude_female_pop <- function(type = "standard", source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn"))

  # Estimates source
  if(source == "datasus"){
    mun_female_pop <- datasus_mun_female_pop()
  } else if(source == "ufrn"){
    mun_female_pop <- ufrn_mun_female_pop() %>%
      dplyr::mutate(code_muni = as.numeric(substr(.data$code_muni, 0, 6)))
  }

  if(type == "standard"){
    res <- dplyr::left_join(mun_female_pop, brpop::mun_reg_saude, by = "code_muni")
  } else if(type == "reg_saude_449"){
    res <- dplyr::left_join(mun_female_pop, brpop::mun_reg_saude_449, by = "code_muni")
  }

  res <- dtplyr::lazy_dt(x = res) %>%
    dplyr::group_by(.data$codi_reg_saude, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    tibble::as_tibble()

  return(res)
}
