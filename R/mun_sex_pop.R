#' Municipality yearly population estimates per age group and sex
#'
#' This function binds municipality male and female estimates and includes a new variable called 'sex'.
#'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [datasus_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_sex_pop <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "datasus2024"))

  # Estimates source
  if(source == "datasus"){
    mun_male_pop <- datasus_mun_male_pop()
    mun_female_pop <- datasus_mun_female_pop()
  } else if(source == "ufrn"){
    mun_male_pop <- ufrn_mun_male_pop()
    mun_female_pop <- ufrn_mun_female_pop()
  } else if(source == "datasus2024"){
    mun_male_pop <- datasus2024_mun_male_pop()
    mun_female_pop <- datasus2024_mun_female_pop()
  }

  male <- mun_male_pop %>%
    dplyr::mutate(sex = "Male")

  female <- mun_female_pop %>%
    dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(male, female)

  return(res)
}
