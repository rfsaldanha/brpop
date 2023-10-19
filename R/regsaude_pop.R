#' Health region yearly population estimates per age group
#'
#' This function provides a tibble containing population estimates for Brazilian health regions per age groups from 2000 to 2021.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' @format A tibble.
#' \describe{
#'   \item{regsaude}{health region 4 or 5 digits code}
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

regsaude_pop <- function(type = "standard"){

  if(!(type %in% c("standard", "reg_saude_449"))){
    stop("type must be 'standard' or 'reg_saude_449'")
  }

  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  if(type == "standard"){
    res <- dplyr::bind_rows(regsaude_male_pop(), regsaude_female_pop())
  } else if(type == "reg_saude_449"){
    res <- dplyr::bind_rows(regsaude_male_pop(type = "reg_saude_449"), regsaude_female_pop(type = "reg_saude_449"))
  }

  res <- res %>%
    dplyr::group_by(.data$regsaude, .data$year, .data$age_group) %>%
    multidplyr::partition(cluster) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$regsaude, .data$year, .data$age_group)

  return(res)
}
