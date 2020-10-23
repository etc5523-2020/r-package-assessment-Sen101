#' Creates reactive input for Shiny app
#'
#' @param
#' id: The identity entered by users
#' label: What the user sees when the request is entered
#'
#' @return
#' Creates a reactive slider/picker input for Shiny App
#'
#' @examples
#' \dontrun{
#' ui_input("Country", "Select a Country")
#' }
#'
#' @export

ui_input <- function(id, label){
  shiny::selectInput(id,
                     label,
                     choices = c("China, Japan, Thailand, US, Brazil"),
                     selected = "China")
}

