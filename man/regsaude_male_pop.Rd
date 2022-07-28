% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regsaude_male_pop.R
\name{regsaude_male_pop}
\alias{regsaude_male_pop}
\title{Health region yearly male population estimates per age group}
\format{
A tibble with 143,748 rows and 4 variables:
\describe{
\item{regsaude}{health region 4 digits code}
\item{year}{year of the estimative}
\item{age_group}{age group}
\item{pop}{population estimative}
}
}
\usage{
regsaude_male_pop()
}
\value{
A tibble.
}
\description{
This function provides a tibble containing male population estimates for Brazilian health regions per age groups from 2000 to 2021.
}
\details{
The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.

More details about the estimation methodology may be found here: \url{http://tabnet.datasus.gov.br/cgi/POPSVS/NT-POPULACAO-RESIDENTE-2000-2021.PDF}
}
\seealso{
\link{mun_male_pop}, \link{mun_female_pop}.
}