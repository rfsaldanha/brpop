# Changelog

## brpop 0.7.0

- Add the revised 2025 IBGE municipal population estimates sent to the
  TCU on 2026-01-13, while preserving all 2000–2024 values and the
  established `code_muni`, `year`, and `pop` columns.
- Bundle the compact IBGE series with the package, eliminating Internet
  access for
  [`ibge_pop()`](https://rfsaldanha.github.io/brpop/reference/ibge_pop.md)
  and all `source = "ibge"` aggregations.
- Add Boa Esperança do Norte to both health-region lookup tables,
  assigned to the Teles Pires health region according to the Mato Grosso
  State Health Department.
- Remove Internet access from the test suite, addressing the policy
  issue that led CRAN to archive version 0.6.3.
- Make remote-data failures consistently return `NULL` with an
  informative message, as documented in previous releases.
- Correct health-region aggregation for the seven-digit municipality
  codes in the DataSUS 2000–2024 series.
- Revise package metadata, documentation, website configuration, and
  tests.
- Keep existing function signatures, defaults, source labels, and output
  column names for backward compatibility. Dataset loader functions that
  already had help pages are now also exported.

## brpop 0.6.3

CRAN release: 2025-09-03

- Return `NULL` if there is any download related problem.

## brpop 0.6.2

CRAN release: 2025-09-02

- On Internet connection problems to download the required data, the
  package functions will not present errors but fail gracefully with an
  informative message, attending CRAN requirements.

## brpop 0.6.1

- Add argument `sex` to `mum_pop_age()`,
  [`regsaude_pop_age()`](https://rfsaldanha.github.io/brpop/reference/regsaude_pop_age.md)
  and
  [`uf_pop_age()`](https://rfsaldanha.github.io/brpop/reference/uf_pop_age.md)
  functions to subset population based on sex.

## brpop 0.6.0

CRAN release: 2025-02-24

- Add DataSUS new population estimates (2000 - 2024) source option to
  all functions
- Improve documentation with timespan estimates of all sources

## brpop 0.5.0

CRAN release: 2024-10-17

- Move data files to Zenodo and use {zendown} package to handle file
  download. This will keep the package smaller for future CRAN versions.

## brpop 0.4.1

- Add IBGE population estimates for 2023 and 2024.

## brpop 0.4.0

- Add population estimates from the UFRN-PPGDem-LEPP (2010 to 2030) for
  sex and age groups.
- Add total municipality population from IBGE estimates, Census and
  Population Inquiries (2000 to 2022).
- Adopt `dtplyr` for faster computations.
- Documentation revision.
- Function names revision.

## brpop 0.3.0

CRAN release: 2023-10-24

- Bug correction on `mun_reg_saude`: remove duplicated records.
- Add arguments to `reg_saude_*` functions to use the 449 units health
  region version.

## brpop 0.2.0

- Bug correction on `uf_pop_totals` and `regsaude_pop_totals`.

## brpop 0.1.7

- Bug correction on `mun_pop_totals`. Thanks to
  [@filipemsc](https://github.com/filipemsc)!

## brpop 0.1.6

- New function for health region and sex (`regsaude_sex_pop`) and small
  bug fixes.

## brpop 0.1.5

CRAN release: 2022-08-18

- Variables types modification.

## brpop 0.1.4

- Bug correction: remove total records from sum on total functions.

## brpop 0.1.3

- Add functions for male and female population totals.

## brpop 0.1.2

- Add functions for health regions population estimatives.

## brpop 0.1.1

- Add functions for UF and municipalities population totals.

## brpop 0.1.0

CRAN release: 2022-07-06

- First release of the package.
