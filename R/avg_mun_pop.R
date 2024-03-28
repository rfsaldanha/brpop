#' Average municipality population over estimates
#'
#' @param sex character. `male` or `female`.
#'
#' @return a tibble.
#' @export
#'
avg_mun_pop <- function(sex){
  if(sex == "male"){
    bmh_mun <- brpop::bmh_mun_male_pop
    ufrn_mun <- brpop::ufrn_mun_male_pop
  } else if(sex == "female"){
    bmh_mun <- brpop::bmh_mun_female_pop
    ufrn_mun <- brpop::ufrn_mun_female_pop
  }

  bmh_mun <- bmh_mun %>%
    dplyr::rename(pop_bmh = "pop")

  ufrn_mun <- ufrn_mun %>%
    dplyr::mutate(mun = as.numeric(substr(.data$mun, 0, 6))) %>%
    dplyr::rename(pop_ufrn = "pop")

  res <- dplyr::full_join(bmh_mun, ufrn_mun,
                          by = c("mun", "year", "age_group")) %>%
    dplyr::mutate(pop = rowMeans(dplyr::select(., dplyr::all_of(c("pop_bmh", "pop_ufrn"))), na.rm = TRUE)) %>%
    dplyr::select(-"pop_bmh", -"pop_ufrn")

  return(res)
}
