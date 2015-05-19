#load the mtcar dataset
data(mtcars)

#get the fit for the linear model to be used for the prediction
fit <<- lm(mpg~am+hp+wt+qsec+hp*wt, data=mtcars) 

#function to calculate the new value of mpg based on new inputs
mgpValue <- function (fit, amval, wtval, hpval, qsecval){
    nd=data.frame(am=amval, hp=hpval, wt=wtval, qsec=qsecval)
    predict(fit, newdata=nd)
}

shinyServer(
    
    function(input, output){
        output$amType <- renderPrint({ifelse(input$amTypeId == 0, 'Automatic', 'Manual')})
        output$wt <- renderPrint({as.numeric(input$wtId)})
        output$hp <- renderPrint({input$hpId})
        output$qsec <- renderPrint({input$qsecId})
        mpg <- reactive({mgpValue(fit, as.numeric(input$amTypeId), input$wtId, input$hpId, input$qsecId)[1]})
        output$mpg <- renderPrint({as.vector(round(mpg(),2))})
    }    
)