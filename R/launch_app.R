#' Launch the shiny app to explore the further information about COVID-19
#'
#' @description
#' Runs the Covid-19 Shiny app which contains in the `COVIDsen` package.
#'
#' @import shiny
#'
#' @examples
#' \dontrun{
#' launch_app()
#' }
#'
#' @export

launch_app <- function(){
  appDir <- system.file("app", "app.R", package = "COVIDsen")
  if(appDir == ""){
    stop("Could not find example directory. Try re-installing `COVIDsen` package")
  }

  shiny::runApp(appDir, display.mode = "normal")
}
