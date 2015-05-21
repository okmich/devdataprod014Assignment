getInit <<- function(lower, upper) round(runif(1, lower, upper),2)

shinyUI(fluidPage(
    titlePanel("Evaluating Gas Efficiency"),
    div(strong(em("Author: Michael Enudi"))
        ,style='text-align:left'), 
    br(),
    
    tabsetPanel(
        tabPanel("Documentation", 
                 verticalLayout(
                     h4("Description"),
                     helpText("We are using the Motor Trend Car Road Test dataset from the basic R installation as the basis for predicting gas efficiency given any of values of 'transmission type', 'Weigth','Gross horse power', and 'time for 1/4 mile'."),
                     helpText("This application is therefore designed to help users guage the effect of these features on the outcome which is 'miles per gallon'. Since the goal of any auto buyer will be to optimize the outcome given the other features, users can use this app for that purpose."),
                     h4("Instruction"),
                     helpText("Click on the 'Workspace' tab above to access the calculation workspace where you can evaluate the effect of the features on our output value 'miles per gallon'."),
                     br()
                 )
        ),
        tabPanel("Workspace", 
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
                                 step = 0.5, value=getInit(5, 30))
                 ),
                 mainPanel(
                     h4("Instruction"),
                     helpText("Alter the values of the variables in any of the input fields on the side and watch the effect on the value of the miles per gallon below."),
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
                     )
                 )
             )
        )    
    ),
    hr(),
    em("Note that the emphasis on this project is not on model design and feature selection but on the design of a shiny application as required in the coursera 'Developing Data Product' assignment and the result on this page should not be taken as true or correct values of the study", style='font-size:small;'),
    hr()
))