library(shiny)
library(ggplot2)
library(DT)
library(S7)

ui <- fluidPage(
  plotOutput(outputId = "plot",
             brush = "plot_brush"),
  DTOutput(outputId = "table")
)

server <- function(input, output) {
  output$plot <- renderPlot(
    ggplot(mtcars) +
      geom_point(aes(x = mpg,
                     y = disp)) +
      labs(title = "Miles per Gallon vs Displacement", 
           subtitle = "mpg (miles per gallon): measures fuel efficiency.\ndisp (Displacement): measures engine size in cubic inches.", 
           caption = "Negative correlation: larger engines consume more fuel.\nDrag mouse and select one or more points to see details.") +
      theme_bw() +
      theme(axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14), 
            axis.text.x = element_text(size = 13, angle = 0, hjust = 1),
            axis.text.y = element_text(size = 13),
            plot.title = element_text(size = 16, hjust = 0, vjust = 2.5),
            plot.subtitle = element_text(size = 13, hjust = 0, vjust = 2.5),
            plot.caption = element_text(size = 13, hjust = 0, vjust = 2.5),
            plot.margin = unit(c(0.45, 0.3, 0.25, 0.2), "inches"))
  )
  output$table <- renderDT({
    brushedPoints(df = mtcars,
                  brush = input$plot_brush)
  })
}

shinyApp(ui = ui, server = server)