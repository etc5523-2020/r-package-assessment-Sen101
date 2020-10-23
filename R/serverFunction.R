#' Create different countries dataset
#'
#' @description
#' Function `selected()` can filter different countries
#'
#' @param
#' country: selected country
#'
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
selected <- function(country){
  data <- COVIDsen::covid %>%
    dplyr::rename(c("Country" = "Country/Region", "State" = "Province/State")) %>%
    dplyr::na.omit(data)

  data2 <- data %>%
    dplyr::select(Date, Country, Confirmed, Recovered, Deaths) %>%
    dplyr::group_by(Date, Country) %>%
    dplyr::summarise(Confirmed = dplyr::sum(Confirmed),
                     Recovered = dplyr::sum(Recovered),
                     Deaths = dplyr::sum(Deaths)) %>%
    dplyr::pivot_longer(cols = Confirmed : Deaths, names_to = "type", values_to = "cases")

  selected <- data2 %>% dplyr::filter(Country == country)
}

