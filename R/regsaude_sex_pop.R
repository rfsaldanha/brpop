#' Health regions yearly population estimates per age group and sex
#'
#' This function binds UF male and female datasets (`uf_male_pop` and `uf_female_pop`), aggregates estimatives by health regions and includes a new variable called 'sex'.
#'
#' @returns A tibble.
#' @seealso [uf_male_pop], [uf_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_sex_pop <- function(){
  cluster <- multidplyr::new_cluster(n = future::availableCores(omit = 1))

  regsaude_male_pop <- regsaude_male_pop() %>%
    dplyr::mutate(sex = "Male")
  regsaude_female_pop <- regsaude_female_pop() %>%
    dplyr::mutate(sex = "Female")

  res <- dplyr::bind_rows(regsaude_male_pop, regsaude_female_pop) %>%
    dplyr::group_by(.data$regsaude, .data$year, .data$age_group, .data$sex) %>%
    multidplyr::partition(cluster) %>%
    dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
    dplyr::collect() %>%
    dplyr::ungroup() %>%
    dplyr::arrange(.data$regsaude, .data$year, .data$age_group, .data$sex) %>%
    dplyr::relocate(.data$sex, .after = .data$pop)

  return(res)
}
