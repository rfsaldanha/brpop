#' Municipality yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian municipalities per age groups from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' @format A tibble with 2,216,016 rows and 4 variables:
#' \describe{
#'   \item{mun}{municipality 6 digits code}
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

mun_pop <- function(){

  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  res <- dplyr::bind_rows(brpop::mun_male_pop, brpop::mun_female_pop) %>%
    dplyr::group_by(.data$mun, .data$year, .data$age_group) %>%
    multidplyr::partition(cluster) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$mun, .data$year, .data$age_group, .data$pop)

  return(res)
}
