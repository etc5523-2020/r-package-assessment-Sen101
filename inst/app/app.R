#
# This is a Shiny web application. You can run the application by clicking the 'Run App' button above.

library(tidyverse)
library(shiny)
library(plotly)
library(leaflet)
library(ggplot2)
library(DT)

# read data

data <- covid %>%
  rename(c("Country" = "Country/Region", "State" = "Province/State"))
data <- na.omit(data)

# wrangling data

data2 <- data %>%
  select(Date, Country, Confirmed, Recovered, Deaths) %>%
  group_by(Date, Country) %>%
  summarise(Confirmed = sum(Confirmed),
            Recovered = sum(Recovered),
            Deaths = sum(Deaths)) %>%
  pivot_longer(cols = Confirmed : Deaths, names_to = "type", values_to = "cases")

data3 <- data %>%
  group_by(Date, Country, State, Longitude, Latitude) %>%
  summarise(Confirmed = sum(Confirmed),
            Recovered = sum(Recovered),
            Deaths = sum(Deaths)) %>%
  pivot_longer(cols = Confirmed : Deaths, names_to = "type", values_to = "cases")


# shiny part

ui <- navbarPage("COVID-19 Analysis",
                 tabPanel("Country Cases Trend",
                          sidebarLayout(
                            sidebarPanel = sidebarPanel(
                              selectInput(
                                inputId = 'Country',
                                label = "Select a Country",
                                choices = sort(unique(data2$Country)),
                                selected = sort(unique(data2$Country))[1]
                              ),
                              width = 4
                            ),
                            mainPanel = mainPanel(
                              plotlyOutput(outputId = 'plotly', height = '400px'),
                              textOutput(outputId = 'selected_country'),
                              width = 8
                            )
                          )),

                 tabPanel("World Map of COVID-19",
                          sidebarLayout(
                            sidebarPanel = sidebarPanel(
                              selectInput(
                                inputId = 'type',
                                label = "Select a Type",
                                choices = sort(unique(data3$type)),
                                # choose seventh option as default selected
                                selected = sort(unique(data3$type))[1]
                              ),
                              selectInput(
                                inputId = 'Date',
                                label = "Select a Date",
                                choices = sort(unique(data3$Date)),
                                # choose seventh option as default selected
                                selected = sort(unique(data3$Date))[1]
                              ),
                              width = 4 # set the width of sidebar part
                            ),
                            mainPanel = mainPanel(
                              leafletOutput(outputId = 'map', height = '350px'),
                              textOutput(outputId = 'selected_type'),
                              textOutput(outputId = 'selected_Date'),
                              width = 8,
                            )
                          )),

                 tabPanel("Table",
                          DT::dataTableOutput("table"))

)



server <- function(input, output, session) {
  output$selected_region <- renderText({
    paste('Selected Country: ', input$Country)
  })

  output$plotly <- renderPlotly({
    selected_data <- data2 %>% filter(Country == input$Country)
    ggplot(selected_data, aes(x = Date, y = cases, colour = type)) +
      geom_line() +
      xlab("") +
      ylab("Number") +
      scale_y_continuous(labels = scales::comma) +
      theme(axis.text.x = element_blank()) +
      theme(axis.ticks.x = element_blank())
  })

  output$map <- renderLeaflet({
    selected_data2 <- data3 %>% filter(Date == input$Date,
                                       type == input$type)
    # create leaflet map
    leaflet() %>%
      addProviderTiles("CartoDB") %>%
      setView(lng = 0, lat = 10, zoom = 1.5) %>%
      addCircleMarkers(
        data = selected_data2,
        lng = ~ Longitude,
        lat = ~ Latitude,
        radius = ~ (cases  %>% log(base = exp(2))),
        color = "red",
        fillOpacity = ~ ifelse(cases > 0, 1, 0),
        stroke = FALSE,
        label = ~ paste0(State, " ", Country, ": ", cases),
        popup = ~ paste0("<b>", State, " ", Country, "</b><br>Cases: ", cases)
      )
  })

  output$table <- DT::renderDataTable({
    DT::datatable(data3)
  })

}

shinyApp(ui = ui, server = server)
