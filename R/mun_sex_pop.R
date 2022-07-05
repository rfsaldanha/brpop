#' Municipality yearly population estimates per age group and sex
#'
#' This function binds UF male and female datasets (`mun_male_pop` and `mun_female_pop`) and includes a new variable called 'sex'.
#'
#' @returns A tibble.
#' @seealso [mun_male_pop], [mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_sex_pop <- function(){
  male <- brpop::mun_male_pop %>%
    dplyr::mutate(sex = "Male")

  female <- brpop::mun_female_pop %>%
    dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(male, female)

  return(res)
}
