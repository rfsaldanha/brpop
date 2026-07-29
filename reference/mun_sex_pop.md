# Municipality yearly population estimates per age group and sex

This function binds municipality male and female estimates and includes
a new variable called 'sex'.

## Usage

``` r
mun_sex_pop(source = "datasus")
```

## Arguments

- source:

  character. `datasus` for Brazilian Health Ministry old estimates (2000
  to 2021), `datasus2024` for Brazilian Health Ministry new estimates
  (2000 to 2024), or `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030).

## Value

A tibble.

## See also

[datasus_mun_male_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_male_pop.md),
[datasus_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/datasus_mun_female_pop.md),
[ufrn_mun_male_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_male_pop.md),
[ufrn_mun_female_pop](https://rfsaldanha.github.io/brpop/reference/ufrn_mun_female_pop.md).
