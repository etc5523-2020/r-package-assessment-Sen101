test_that("selected()", {
  testthat::expect_equal(selected("Country", "Select a Country"),
                         shiny::selectInput(inputId = "Country",
                                               label = "Select a Country",
                                               choices = c("China, Japan, Thailand, US, Brazil"),
                                               selected = "China")
  )
})
