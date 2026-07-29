# Municipality population from IBGE, 2000 to 2025

Municipal total population from the Brazilian Institute of Geography and
Statistics (IBGE), combining censuses, the 2007 population count, and
annual population estimates. The data do not contain age or sex
breakdowns.

## Usage

``` r
ibge_pop()
```

## Value

A tibble with one row per municipality and year.

- code_muni:

  numeric municipality code with seven digits

- year:

  numeric reference year

- pop:

  numeric population; `NA` when the source reports no value

## Details

Census values for 2000 and 2010 come from [SIDRA table
202](https://sidra.ibge.gov.br/tabela/202), and 2022 values come from
[SIDRA table 9514](https://sidra.ibge.gov.br/tabela/9514). The 2007
population count comes from [SIDRA table
793](https://sidra.ibge.gov.br/tabela/793).

Annual estimates for 2001–2006, 2008–2009, and 2011–2021 come from
[SIDRA table 6579](https://sidra.ibge.gov.br/tabela/6579), as updated on
2024-06-24. Values for 2023 are the population figures sent to the TCU
using the 2022 Census and 2023 territorial grid, available from the
[IBGE 2023 download
directory](https://ftp.ibge.gov.br/Informacoes_Gerais_e_Referencia/Relacao_da_Populacao_dos_Municipios_para_publicacao_no_DOU_em_2023/).
Values for 2024 come from the estimates published in the DOU. Values for
2025 use the revised estimates sent to the TCU on 2026-01-13. The source
workbooks are available from the IBGE download directories for
[2024](https://ftp.ibge.gov.br/Estimativas_de_Populacao/Estimativas_2024/)
and
[2025](https://ftp.ibge.gov.br/Estimativas_de_Populacao/Estimativas_2025/).

`ibge_pop()` is bundled with the package and does not require Internet
access. Its return structure remains compatible with previous releases.
