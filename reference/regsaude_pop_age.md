# Health region yearly population estimates per age group

This function provides a tibble containing population estimates for
Brazilian health regions by age group.

## Usage

``` r
regsaude_pop_age(type = "standard", source = "datasus", sex = "all")
```

## Arguments

- type:

  character. 'standard' or 'reg_saude_449'

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

[regsaude_male_pop](https://rfsaldanha.github.io/brpop/reference/regsaude_male_pop.md),
[regsaude_female_pop](https://rfsaldanha.github.io/brpop/reference/regsaude_female_pop.md).
