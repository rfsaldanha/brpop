#' Health region yearly total population estimates
#'
#' This function provides a tibble containing total population estimates for Brazilian health regions.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#' @param source character. `datasus` for Brazilian Health Ministry estimates (2000 to 2021), `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030), or `ibge` for IBGE estimates (2000 to 2022).
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop], [ibge_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_pop_totals <- function(type = "standard", source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = type, choices = c("standard", "reg_saude_449"))
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "ibge"))

  if(source == "datasus" | source == "ufrn"){
    res <- dplyr::bind_rows(regsaude_male_pop_totals(type = type, source = source),
                          regsaude_female_pop_totals(type = type, source = source)) %>%
      dtplyr::lazy_dt() %>%
      dplyr::group_by(.data$regsaude, .data$year) %>%
      dplyr::summarise(pop = sum(.data$pop)) %>%
      dplyr::ungroup() %>%
      dplyr::arrange(.data$regsaude, .data$year) %>%
      tibble::as_tibble()
  } else if(source == "ibge"){
    if(type == "standard"){
      tmp <- brpop::ibge_pop %>%
        dplyr::mutate(code_muni = as.numeric(substr(.data$code_muni, 0, 6))) %>%
        dplyr::left_join(brpop::mun_reg_saude,
                              by = "code_muni")
    } else if(type == "reg_saude_449"){
      tmp <- brpop::ibge_pop %>%
        dplyr::mutate(code_muni = as.numeric(substr(.data$code_muni, 0, 6))) %>%
        dplyr::left_join(brpop::mun_reg_saude_449,
                              by = "code_muni")
    }

    res <- tmp %>%
      dtplyr::lazy_dt() %>%
      dplyr::group_by(.data$codi_reg_saude, .data$year) %>%
      dplyr::summarise(pop = sum(.data$pop)) %>%
      dplyr::ungroup() %>%
      dplyr::arrange(.data$codi_reg_saude, .data$year) %>%
      tibble::as_tibble()
  }


  return(res)
}
