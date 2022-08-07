#' Health region yearly male population estimates totals
#'
#' This function provides a tibble containing male population estimates for Brazilian health regions totals from 2000 to 2021.
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' \describe{
#'   \item{regsaude}{health region 4 digits code}
#'   \item{year}{year of the estimative}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_male_pop_totals <- function(){

  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  res <- regsaude_male_pop() %>%
    dplyr::filter(.data$age_group != "Total") %>%
    dplyr::group_by(.data$regsaude, .data$year) %>%
    multidplyr::partition(cluster) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$regsaude, .data$year, .data$pop)

  return(res)
}
