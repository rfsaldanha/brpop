#' Health region yearly male population estimates per age group
#'
#' This function provides a tibble containing male population estimates for Brazilian health regions per age groups from 2000 to 2021.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
#'
#' @format A tibble.
#' \describe{
#'   \item{regsaude}{health region with 4 or 5 digits code}
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

regsaude_male_pop <- function(type = "standard"){

  if(!(type %in% c("standard", "reg_saude_449"))){
    stop("type must be 'standard' or 'reg_saude_449'")
  }

  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  if(type == "standard"){
    res <- dplyr::left_join(brpop::mun_male_pop, brpop::mun_reg_saude, by = c("mun" = "cod_mun"))
  } else if(type == "reg_saude_449"){
    res <- dplyr::left_join(brpop::mun_male_pop, brpop::mun_reg_saude_449, by = c("mun" = "cod_mun"))
  }

  res <- res %>%
    dplyr::group_by(regsaude = .data$cod_reg_saude, .data$year, .data$age_group) %>%
    multidplyr::partition(cluster) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::ungroup()

  return(res)
}
