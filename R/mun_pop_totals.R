#' Municipality yearly population estimates totals
#'
#' This function provides a tibble containing population estimates for Brazilian municipalities totals from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' \describe{
#'   \item{mun}{municipality 6 digits code}
#'   \item{year}{year of the estimative}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [mun_male_pop], [mun_female_pop].
#'
#' @importFrom rlang .data
#' @export

mun_pop_totals <- function(){
  res <- dplyr::bind_rows(brpop::mun_male_pop, brpop::mun_female_pop) %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::group_by(mun, year) %>% 
    dplyr::summarise(pop = sum(pop)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$mun, .data$year)

  return(res)
}
