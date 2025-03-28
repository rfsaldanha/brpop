% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uf_sex_pop.R
\name{uf_sex_pop}
\alias{uf_sex_pop}
\title{UF yearly population estimates per age group and sex}
\usage{
uf_sex_pop(source = "datasus")
}
\arguments{
\item{source}{character. \code{datasus} for Brazilian Health Ministry old estimates (2000 to 2021), \code{datasus2024} for Brazilian Health Ministry new estimates (2000 to 2024), or \code{ufrn} for UFRN-DEM-LEPP estimates (2010 to 2030).}
}
\value{
A tibble.
}
\description{
This function binds municipality male and female estimates and includes a new variable called 'sex'.
}
\seealso{
\link{datasus_mun_male_pop}, \link{datasus_mun_female_pop}, \link{ufrn_mun_male_pop}, \link{ufrn_mun_female_pop}.
}
