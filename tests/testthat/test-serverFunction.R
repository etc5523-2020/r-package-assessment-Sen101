test_that("filtered()", {
  expect_equal(filtered(covid, "Australia", "2020-10-01"),
               covid %>%
                 dplyr::filter(`Country/Region`== "Australia",
                               Date == "2020-10-01"))

})
