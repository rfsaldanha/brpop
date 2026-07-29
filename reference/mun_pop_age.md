# Municipality yearly population estimates per age group

This function provides a tibble containing population estimates for
Brazilian municipalities by age group.

## Usage

``` r
mun_pop_age(source = "datasus", sex = "all")
```

## Arguments

- source:

  character. `datasus` for Brazilian Health Ministry old estimates (2000
  to 2021), `datasus2024` for Brazilian Health Ministry new estimates
  (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).

- sex:

  character. `all` for all population, `male` for male population,
  `female` for female population. Defaults to `all`.

## Value

A tibble.

## See also

[datasus_mun_male_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_male_pop.md),
[datasus_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_female_pop.md),
[ufrn_mun_male_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_male_pop.md),
[ufrn_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_female_pop.md).
