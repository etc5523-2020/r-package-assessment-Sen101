## code to prepare `covid-19-all` dataset goes here


covid <- read_csv("data-raw/covid-19-all.csv")


usethis::use_data(covid, overwrite = TRUE)
