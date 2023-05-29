#' Health region yearly male population estimates totals
#'
#' This function provides a tibble containing male population estimates for Brazilian health regions totals from 2000 to 2021.
#'
#' @param type character. 'standard' or 'reg_saude_449'
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

regsaude_male_pop_totals <- function(type = "standard"){

  if(!(type %in% c("standard", "reg_saude_449"))){
    stop("type must be 'standard' or 'reg_saude_449'")
  }

  if(type == "standard"){
    res <- regsaude_male_pop()
  } else if(type == "reg_saude_449"){
    res <- regsaude_male_pop(type = "reg_saude_449")
  }

  res <- res %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$regsaude, .data$year)

  return(res)
}
