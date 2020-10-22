#' global covid-19 epidemic
#'
#' @description
#' This dataset contains global covid-19 epidemic situations of 215 countries.
#' @format  A data frame with columns:
#' \describe{
#'  \item{Country/Region}{Country or Region; ex: Mainland China, Romania, Italy}
#'  \item{Province/State}{Province or State; ex: Hubei}
#'  \item{Latitude}{Latitude of the Country}
#'  \item{Longitude}{Longitude of the Country}
#'  \item{Confirmed}{Confirmed number of cases}
#'  \item{Recovered}{Number of recovered patients}
#'  \item{Deaths}{Number of deaths}
#'  \item{Date}{Date of the report}
#' }
#'
#'
#' @import tibble
#'
#' @source [covid](https://www.kaggle.com/andradaolteanu/covid-19-sentiment-analysis-social-networks/?select=covid-19-all.csv)
"covid"
