#' Municipality yearly female population estimates per age group, from 2010 to 2030
#'
#' A dataset containing female population estimates for Brazilian municipalities by age group from 2010 to 2030.
#'
#' The estimates were computed by the LEPP laboratory from the Demography Department/UFRN.
#'
#' \describe{
#'   \item{code_muni}{municipality 7 digits code}
#'   \item{year}{year of the estimate}
#'   \item{age_group}{age group}
#'   \item{pop}{population estimate}
#' }
#'
#' @references FREIRE, F.H.M.A; GONZAGA, M.R; QUEIROZ, B.L. Projeção populacional municipal com estimadores bayesianos, Brasil 2010 - 2030. In: Sawyer, D.O (coord.).  Seguridade Social Municipais. Projeto Brasil 3 Tempos. Secretaria  Especial de Assuntos Estratégicos da Presidência da República (SAE/SG/PR) , United Nations Development Programme, Brazil (UNDP) and International Policy  Centre for Inclusive Growth. Brasília (IPC-IG), 2019.
#' @export
ufrn_mun_female_pop <- function() {
  .zenodo_data("ufrn_mun_female_pop.rds")
}
