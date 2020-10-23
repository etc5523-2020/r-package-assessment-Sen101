#' Creates reactive input for Shiny app
#'
#' @param
#' country: selected country
#' data: original data
#'
#' @return
#' Creates a reactive slider/picker input for Shiny App
#'
#' @examples
#' \dontrun{
#' selected(country = China)
#' }
#'
#' @export

ui_input <- function(country, data){
  selectInput(
    inputId = country,
    label = "Select a Country",
    choices = sort(unique(data$Country)),
    selected = sort(unique(data$Country))[1])
}

