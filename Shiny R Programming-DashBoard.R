######--Interactive Time Series Data Analysis with R and Shiny: Dashboard Approach"--##########

install.packages(c("shiny", "shinydashboard", "ggplot2", "plotly"))
# Load required packages
library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)

# Define the UI for the dashboard
ui <- dashboardPage(
  dashboardHeader(title = "Interactive Shiny Dashboard"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Charts", tabName = "charts", icon = icon("chart-line")),
      menuItem("Time Series", tabName = "timeseries", icon = icon("calendar-day"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "charts",
              fluidRow(
                box(title = "Interactive Histogram", status = "primary", solidHeader = TRUE,
                    sliderInput("histBins", "Number of bins:", min = 1, max = 50, value = 30),
                    plotlyOutput("histPlot")
                ),
                box(title = "Interactive Scatter Plot", status = "primary", solidHeader = TRUE,
                    selectInput("scatterX", "X-axis variable:", choices = names(mtcars), selected = "wt"),
                    selectInput("scatterY", "Y-axis variable:", choices = names(mtcars), selected = "mpg"),
                    plotlyOutput("scatterPlot")
                )
              )
      ),
      
      tabItem(tabName = "timeseries",
              fluidRow(
                box(title = "Time Series Data", status = "primary", solidHeader = TRUE,
                    dateRangeInput("dateRange", "Select Date Range:",
                                   start = as.Date("2024-01-01"),
                                   end = as.Date("2024-12-31")),
                    plotlyOutput("timeSeriesPlot")
                )
              )
      )
    )
  )
)

# Define the server logic
server <- function(input, output) {
  # Reactive data for histogram
  reactiveData <- reactive({
    rnorm(500)
  })
  
  # Histogram plot
  output$histPlot <- renderPlotly({
    data <- reactiveData()
    plot_ly(x = ~data, type = "histogram", nbinsx = input$histBins) %>%
      layout(title = "Histogram of Random Data",
             xaxis = list(title = "Value"),
             yaxis = list(title = "Frequency"))
  })
  
  # Scatter plot
  output$scatterPlot <- renderPlotly({
    plot_ly(data = mtcars, x = ~get(input$scatterX), y = ~get(input$scatterY), type = 'scatter', mode = 'markers') %>%
      add_lines(x = ~get(input$scatterX), y = ~fitted(lm(get(input$scatterY) ~ get(input$scatterX), data = mtcars)),
                line = list(color = 'red')) %>%
      layout(title = paste("Scatter Plot of", input$scatterY, "vs", input$scatterX),
             xaxis = list(title = input$scatterX),
             yaxis = list(title = input$scatterY))
  })
  
  # Time series data
  time_series_data <- reactive({
    dates <- seq.Date(as.Date("2024-01-01"), as.Date("2024-12-31"), by = "days")
    values <- cumsum(rnorm(length(dates)))
    data.frame(Date = dates, Value = values)
  })
  
  # Time series plot
  output$timeSeriesPlot <- renderPlotly({
    data <- time_series_data()
    filtered_data <- subset(data, Date >= input$dateRange[1] & Date <= input$dateRange[2])
    plot_ly(data = filtered_data, x = ~Date, y = ~Value, type = 'scatter', mode = 'lines+markers') %>%
      layout(title = "Time Series Plot",
             xaxis = list(title = "Date"),
             yaxis = list(title = "Value"))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
