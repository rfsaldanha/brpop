# IBGE population sources

The `ibge_pop` data-preparation script combines the following official IBGE
sources. Files are kept in this directory so the released dataset can be
reproduced and audited.

- 2000 and 2010 Census: SIDRA table 202.
- 2007 Population Count: SIDRA table 793.
- 2001–2006, 2008–2009, and 2011–2021 estimates: SIDRA table 6579, update of
  2024-06-24.
- 2022 Census: SIDRA table 9514.
- 2023 population sent to the TCU using the 2022 Census and 2023 territorial
  grid: `POP_TCU_2023_Municipios_POP2022_Malha2023.*`.
- 2024 estimates published in the DOU: `estimativa_dou_2024.*`.
- 2025 estimates sent to the TCU, revision of 2026-01-13:
  `POP2025_20260113.xls`.

Official directories:

- <https://ftp.ibge.gov.br/Informacoes_Gerais_e_Referencia/Relacao_da_Populacao_dos_Municipios_para_publicacao_no_DOU_em_2023/>
- <https://ftp.ibge.gov.br/Estimativas_de_Populacao/Estimativas_2024/>
- <https://ftp.ibge.gov.br/Estimativas_de_Populacao/Estimativas_2025/>

SHA-256 of `POP2025_20260113.xls`:

`af63966d2ca32b285fac81994e243b822c096f3ad51106adc7689b6f74cabd05`
