getInit <<- function(lower, upper) round(runif(1, lower, upper),2)

shinyUI(fluidPage(
    titlePanel("Evaluating Gas Efficiency"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Adjust the value selected below"),
            br(),
            radioButtons("amTypeId", "Transmission Type",
                         choices = c("Automatic" = 0,
                                     "Manual" = 1)),
            sliderInput("wtId", "Weight (lb/1000)", min = 0.25, max=6, 
                        step = 0.25, value = getInit(0.25, 6)),
            numericInput("hpId", "Gross horsepower", min = 25, max=400, 
                        step = 1, value=getInit(25, 400)),
            sliderInput("qsecId", "1/4 mile time", min = 5, max=30, 
                        step = 0.5, value=getInit(5, 30)),
            hr(),
            div(strong(em("Author: Michael Enudi"))
                ,style='text-align:right')
        ),
        mainPanel(
            h4("Description"),
            helpText("We are using the Motor Trend Car Road Test dataset from the basic R installation as the basis for predicting gas efficiency given any of values of 'transmission type', 'Weigth','Gross horse power', and 'time for 1/4 mile'."),
            h4("Instruction"),
            helpText("All you have to do is try out different values of the variables on the side bar to see the predicted value of gas efficiency in terms of miles per gallon."),
            br(),
            p(
                h4("Values"),
                h5("Transmission Type: "),
                verbatimTextOutput("amType"),
                h5("Weight (1lb/1000): "),
                verbatimTextOutput("wt"),
                h5("Time to cover a quarter mile: "),
                verbatimTextOutput("qsec"),
                h5("Gross horsepower: "),
                verbatimTextOutput("hp"),
                h5("Predicted Miles per Gallon "),
                verbatimTextOutput("mpg")
            ),
            br(),
            hr(),
            em("Note that the emphasis on this project is not on model design and feature selection but on the design of a shiny application as required in the coursera 'Developing Data Product' assignment and the result on this page should not be taken as true or correct values of the study"),
            hr(),
            div(strong(em("Author: Michael Enudi"))
                ,style='text-align:right')
        )
    )
))