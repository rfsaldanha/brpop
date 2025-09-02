#' Municipality population from IBGE estimates, Census and population inquiries from 2000 to 2024
#'
#' A dataset containing total population estimates for Brazilian municipalities from IBGE estimates, Census and population inquiries. This dataset does not contain breakdowns by age groups or sex.
#'
#' The population data was downloaded from the IBGE's SIDRA service and IBGE's FTP server.
#'
#' Population data for the years of 2000 and 2010 were obtained from Census, SIDRA table 202 (<https://sidra.ibge.gov.br/Tabela/202>).
#'
#' Population data for the year of 2022 was obtained from Census, SIDRA table 9514 (<https://sidra.ibge.gov.br/Tabela/9514>).
#'
#' Population data for the year of 2007 was obtained from Population Inquiry, SIDRA table 793 (<https://sidra.ibge.gov.br/Tabela/793>).
#'
#' Population data for the years of 2001 to 2006, 2008, 2009, 2011 to 2021 were obtained from Population Inquiry, SIDRA table 6579 (<https://sidra.ibge.gov.br/Tabela/6579>), including update from 2024-06-24.
#'
#' Population data for 2023 are the IBGE estimates sent to TCU (<https://www.ibge.gov.br/estatisticas/sociais/populacao/37734-relacao-da-populacao-dos-municipios-para-publicacao-no-tcu.html>). The values are equal to Census 2022.
#'
#' Population data for 2024 are the IBGE estimates sent to DOU (<https://www.ibge.gov.br/estatisticas/sociais/populacao/9103-estimativas-de-populacao.html>).
#'
#' \describe{
#'   \item{code_muni}{municipality 7 digits code}
#'   \item{year}{year}
#'   \item{pop}{population}
#' }
ibge_pop <- function() {
  path <- tryCatch(
    {
      zendown::zen_file(deposit_id = zenodo_deposit, file_name = "ibge_pop.rds")
    },
    error = function(cond) {
      message(zendown_error_message)
      message(conditionMessage(cond))
    }
  )

  readRDS(file = path)
}
