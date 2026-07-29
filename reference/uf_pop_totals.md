# UF yearly population totals

This function provides a tibble containing total population estimates
for Brazilian UFs ("Unidades Federativas") totals.

## Usage

``` r
uf_pop_totals(source = "datasus")
```

## Arguments

- source:

  character. `datasus` for Brazilian Health Ministry old estimates (2000
  to 2021), `datasus2024` for Brazilian Health Ministry new estimates
  (2000 to 2024), `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030), or
  `ibge` for IBGE data (2000 to 2025).

## Value

A tibble.

## See also

[datasus_mun_male_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_male_pop.md),
[datasus_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_female_pop.md),
[ufrn_mun_male_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_male_pop.md),
[ufrn_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_female_pop.md),
[ibge_pop](https://rfsaldanha.github.io/brpop/reference/ibge_pop.md).
