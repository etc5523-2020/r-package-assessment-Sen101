#' Creates reactive input for Shiny app
#'
#' @param id The identity entered by users
#' @param label What the user sees when the request is entered
#'
#' @return
#' Creates a reactive slider/picker input for Shiny App
#'
#' @examples
#' \dontrun{
#' selected("Country", "Select a Country")
#' }
#'
#' @export

selected <- function(id, label){
  shiny::selectInput(id,
                     label,
                     choices = c("China, Japan, Thailand, US, Brazil"),
                     selected = "China")
}

