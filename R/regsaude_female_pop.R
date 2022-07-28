#' Health region yearly female population estimates per age group
#'
#' This function provides a tibble containing female population estimates for Brazilian health regions per age groups from 2000 to 2021.
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
#' @seealso [mun_male_pop], [mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_female_pop <- function(){
  res <- dplyr::left_join(brpop::mun_female_pop, brpop::mun_reg_saude, by = c("mun" = "cod_mun")) %>%
    dplyr::group_by(regsaude = .data$cod_reg_saude, .data$year, .data$age_group) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::ungroup()

  return(res)
}