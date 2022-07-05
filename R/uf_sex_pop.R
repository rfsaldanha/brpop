#' UF yearly population estimates per age group and sex
#'
#' This function binds UF male and female datasets (`uf_male_pop` and `uf_female_pop`) and includes a new variable called 'sex'.
#'
#' @returns A tibble.
#' @seealso [uf_male_pop], [uf_female_pop].
#'
#' @importFrom rlang .data
#' @export

uf_sex_pop <- function(){
  male <- brpop::uf_male_pop %>%
    dplyr::mutate(sex = "Male")

  female <- brpop::uf_female_pop %>%
    dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(male, female)

  return(res)
}
