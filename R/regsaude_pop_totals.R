#' Health region yearly population estimates totals
#'
#' This function provides a tibble containing population estimates for Brazilian health regions totals from 2000 to 2021.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' \describe{
#'   \item{regsaude}{health region 4 or 5 digits code}
#'   \item{year}{year of the estimative}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [regsaude_male_pop], [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_pop_totals <- function(type = "standard"){

  if(!(type %in% c("standard", "reg_saude_449"))){
    stop("type must be 'standard' or 'reg_saude_449'")
  }

  if(type == "standard"){
    res <- dplyr::bind_rows(regsaude_male_pop(), regsaude_female_pop())
  } else if(type == "reg_saude_449"){
    res <- dplyr::bind_rows(regsaude_male_pop(type = "reg_saude_449"), regsaude_female_pop(type = "reg_saude_449"))
  }

  res <- res  %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::group_by(.data$regsaude, .data$year) %>%
    dplyr::summarise(pop = sum(.data$pop)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$regsaude, .data$year)

  return(res)
}
