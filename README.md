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

The package provides population estimates for municipalities, UF and health regions by sex and age groups.

The base dataset are population estimates by municipalities and sex.

```{r}
head(mun_female_pop)
head(mun_male_pop)
```

The package provides several functions to aggregate those datasets into multiple ways. The functions are provided for municipalities with the prefix `mun_`, UFs with the prefix `uf_`, and health regions with the prefix `regsaude_`. Those function takes no arguments.

### Estimates by year, sex and age group

The functions `*_sex_pop` binds the estimates by sex into a single tibble with a new variable called sex.

```{r}
mun_sex_pop()
uf_sex_pop()
regsaude_sex_pop()
```

### Estimates by year and age group

The functions `*_pop` aggregates the municipalities' estimates by sex, resulting in a tibble with overall population estimates. 

```{r}
mun_pop()
uf_pop()
regsaude_pop()
```

### Estimates by year

The functions `*_pop_totals` provides the total population estimative.

```{r}
mun_pop_totals()
uf_pop_totals()
regsaude_pop_totals()
```


