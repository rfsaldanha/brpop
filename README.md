# brpop: Brazilian population estimates

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/brpop)](https://CRAN.R-project.org/package=brpop)
[![](https://cranlogs.r-pkg.org/badges/brpop)](https://cran.r-project.org/package=brpop)
<!-- badges: end -->

`brpop` is an `R` package that provides yearly (2000 to 2021) Brazilian population estimates from DataSUS/Brazilian Health Ministry, aggregated by state, municipality, sex, and age groups. Those estimates are especially useful for calculating age and sex standardized disease rates.

The population estimates were downloaded manually at the [DataSUS website](http://tabnet.datasus.gov.br/cgi/deftohtm.exe?popsvs/cnv/popbr.def) and converted to `tibbles` for more convenient use. The population estimation method can be accessed [here](http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF).

## Installation

Stable release at CRAN.

```{r}
install.packages("brpop")
library(brpop)
```

Development version at GitHub.

```{r}
remotes::install_github("rfsaldanha/brpop")
library(brpop)
```

## Usage

The package provides a dataset with two files containing population estimates for municipalities by sex and two files with population estimates for states (UFs) by sex.

```{r}
head(mun_female_pop)
head(mun_male_pop)

head(uf_female_pop)
head(uf_male_pop)
```

The function `mun_pop` aggregates the municipalities' estimates by sex, resulting in a tibble with overall population estimates. This function takes no arguments.

```{r}
mun_pop()
```

The function `mun_sex_pop` binds the estimates by sex into a single tibble with a new variable called sex. This function takes no arguments.

```{r}
mun_sex_pop()
```

The functions `uf_pop` and `uf_sex_pop` work in the same way, providing UF population estimates. Those functions take no arguments.

```{r}
uf_pop()
uf_sex_pop()
```

