# brpop: Brazilian population estimates

<!-- badges: start -->

[![CRAN status](https://www.r-pkg.org/badges/version/brpop)](https://CRAN.R-project.org/package=brpop) [![](https://cranlogs.r-pkg.org/badges/brpop)](https://cran.r-project.org/package=brpop) [![R-CMD-check](https://github.com/rfsaldanha/brpop/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rfsaldanha/brpop/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

`brpop` is an `R` package that provides yearly (2000 to 2021) Brazilian population estimates from DataSUS/Brazilian Health Ministry, aggregated by state, municipality, sex, and age groups. Those estimates are especially useful for calculating age and sex standardized disease rates.

The population estimates were downloaded manually from DataSUS and converted to `tibbles` for more convenient use.

## Installation

Stable release at CRAN.

``` r
install.packages("brpop")
library(brpop)
```

Development version at GitHub.

``` r
remotes::install_github("rfsaldanha/brpop")
library(brpop)
```

## Usage

The package provides population estimates by sex, age groups, municipalities and year from two sources: the [DataSUS estimates](http://tabnet.datasus.gov.br/cgi/IBGE/SEI_MS-0034745983-Nota_Tecnica_final.pdf), covering 2000 to 2021 and the [UFRN-PPGDEM-LEPP estimates](https://demografiaufrn.net/projecao-populacional/), covering from 2010 to 2030.

The package also provide total population estimates by municipality and year from IBGE from 2000 to 2022.

Along with the datasets, the package provide several functions to aggregate the estimates by state (UF) and health regions. Look at the [Reference](https://rfsaldanha.github.io/brpop/reference/index.html) section for more details.
