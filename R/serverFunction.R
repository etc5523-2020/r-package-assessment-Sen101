#' Create different countries and dates dataset
#'
#' @description
#' Function `filtered()` can filter different countries
#'
#' @param
#' country: filtered country
#' date: filtered date
#' data: selected data
#'
#' @examples
#' \dontrun{
#' selected(covid, "Australia", "2020-10-01")
#' }
#'
#' @return different countries dataset
#'
#' @export
#'
filtered <- function(data, country, date){
  data %>%
    dplyr::filter(`Country/Region` == country,
                  Date == date)
}

