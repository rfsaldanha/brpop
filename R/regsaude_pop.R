#' Health region yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian health regions per age groups from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' @format A tibble with 143,748 rows and 4 variables:
#' \describe{
#'   \item{regsaude}{health region 4 digits code}
#'   \item{year}{year of the estimative}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_pop <- function(){
  res <- dplyr::bind_rows(regsaude_male_pop(), regsaude_female_pop()) %>%
    dplyr::group_by(.data$regsaude, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$regsaude, .data$year, .data$age_group, .data$pop)

  return(res)
}
