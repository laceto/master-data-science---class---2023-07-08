library(shiny)
library(reactable)

ui <- fluidPage(
  titlePanel("reactable example"),
  reactableOutput("table")
)

server <- function(input, output, session) {
  output$table <- renderReactable({
    reactable(
      iris,
      defaultColDef = colDef(
        header = function(value) gsub(".", " ", value, fixed = TRUE),
        cell = function(value) format(value, nsmall = 1),
        align = "center",
        minWidth = 70,
        headerStyle = list(background = "#f7f7f8")
      ),
      columns = list(
        Species = colDef(minWidth = 140),  # overrides the default,
        Sepal.Length = colDef(filterable = FALSE),
        Sepal.Width = colDef(filterable = FALSE),
        Petal.Length = colDef(filterable = FALSE),
        Petal.Width = colDef(filterable = FALSE)
      ),
      bordered = TRUE,
      highlight = TRUE, 
      filterable = TRUE,
      showPagination = TRUE
    )
  })
}

shinyApp(ui, server)
