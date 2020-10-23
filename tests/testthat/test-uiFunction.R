test_that("ui_input()", {
  testthat::expect_equal(ui_input("Country", "Select a Country"),
                         shiny::selectInput(inputId = "Country",
                                               label = "Select a Country",
                                               choices = c("China, Japan, Thailand, US, Brazil"),
                                               selected = "China")
  )
})
