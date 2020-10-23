#' Create different countries and dates dataset
#'
#' @description
#' Function `filtered()` can filter different countries
#'
#' @param
#' country: filtered country
#' date: filtered date
#'
#' @examples
#' \dontrun{
#' selected(country = China)
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

