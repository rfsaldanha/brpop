% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/regsaude_sex_pop.R
\name{regsaude_sex_pop}
\alias{regsaude_sex_pop}
\title{Health regions yearly population estimates per age group and sex}
\usage{
regsaude_sex_pop(type = "standard")
}
\arguments{
\item{type}{character. 'standard' or 'reg_saude_449'}
}
\value{
A tibble.
}
\description{
This function binds UF male and female datasets (\code{uf_male_pop} and \code{uf_female_pop}), aggregates estimatives by health regions and includes a new variable called 'sex'.
}
\seealso{
\link{uf_male_pop}, \link{uf_female_pop}.
}
