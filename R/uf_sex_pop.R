#' UF yearly population estimates per age group and sex
#'
#' This function binds municipality male and female estimates and includes a new variable called 'sex'.
#'
#' @param source character. `bmh` for Brazilian Health Ministry estimates, or `ufrn` for UFRN-DEM-LEPP estimates.
#'
#' @returns A tibble.
#' @seealso [bmh_mun_male_pop], [bmh_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_sex_pop <- function(source = "bmh"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("bmh", "ufrn"))

  # Estimates source
  if(source == "bmh"){
    mun_male_pop <- brpop::bmh_mun_male_pop
    mun_female_pop <- brpop::bmh_mun_female_pop
  } else if(source == "ufrn"){
    mun_male_pop <- brpop::ufrn_mun_male_pop
    mun_female_pop <- brpop::ufrn_mun_female_pop
  }

  male <- mun_male_pop %>%
    dplyr::mutate(sex = "Male")

  female <- mun_female_pop %>%
    dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(male, female)

  return(res)
}
