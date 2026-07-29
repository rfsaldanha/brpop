# brpop: Brazilian population estimates

`brpop` provides annual population estimates for Brazilian
municipalities and functions to aggregate them by state (UF), health
region, sex, and age group. These data are useful for denominators in
demographic and epidemiological indicators, including age- and
sex-standardized rates.

## Data sources

| Source | Years | Detail | Access |
|----|---:|----|----|
| IBGE censuses, count, and annual estimates | 2000–2025 | Municipality totals | Bundled with the package |
| DataSUS, original series | 2000–2021 | Municipality, sex, and age group | Downloaded from Zenodo |
| DataSUS, revised series | 2000–2024 | Municipality, sex, and age group | Downloaded from Zenodo |
| UFRN-PPGDem-LEPP | 2010–2030 | Municipality, sex, and age group | Downloaded from Zenodo |

The 2025 IBGE values are the revised municipal estimates sent to the TCU
on 2026-01-13. The bundled IBGE series can therefore be used without an
Internet connection. Larger sex- and age-specific files are hosted in
the versioned [`brpop` Zenodo
deposit](https://doi.org/10.5281/zenodo.14826487) and cached locally by
`zendown` after the first download.

## Installation

The package is being prepared for re-release on CRAN. Install the
development version from GitHub with:

``` r

# install.packages("remotes")
remotes::install_github("rfsaldanha/brpop")
```

After the CRAN release, the stable version can be installed with:

``` r

install.packages("brpop")
```

## Quick start

``` r

library(brpop)

# Municipality totals from IBGE, including 2025
municipal <- mun_pop_totals(source = "ibge")
municipal_2025 <- municipal[municipal$year == 2025, ]

# State totals from the same source
state_2025 <- uf_pop_totals(source = "ibge")
state_2025 <- state_2025[state_2025$year == 2025, ]

# Health-region totals using the 449-region specification
health_region_2025 <- regsaude_pop_totals(
  type = "reg_saude_449",
  source = "ibge"
)
health_region_2025 <- health_region_2025[
  health_region_2025$year == 2025,
]
```

The established function names, arguments, source labels, and output
column names are retained for compatibility with scripts written for
earlier releases. See the [function
reference](https://rfsaldanha.github.io/brpop/reference/) for the
complete API and source-specific year coverage.

## Data provenance

IBGE source workbooks and the reproducible preparation scripts are kept
in [`data-raw`](https://github.com/rfsaldanha/brpop/tree/main/data-raw).
The latest official municipal files are available from the [IBGE 2025
download
directory](https://ftp.ibge.gov.br/Estimativas_de_Populacao/Estimativas_2025/).
