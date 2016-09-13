
cc<-read.csv('ccd.csv')
ccmod<-glm(default.payment.next.month~LIMIT_BAL+SEX+EDUCATION+MARRIAGE+AGE+PAY_6+BILL_AMT6+
             PAY_AMT6,data=cc, family=binomial())

library(shiny)
shinyServer(
  function(input, output) {
    output$oid1 = renderPrint({input$limit})
    output$oid2 = renderPrint({input$age})
    output$oid3 = renderPrint({input$sex})
    output$oid4 = renderPrint({input$educ})
    output$oid5 = renderPrint({input$lastbill})
    output$oid6 = renderPrint({input$prevpay})
    output$oid7 = renderPrint({input$payhist})
    output$oid8 = renderPrint({input$marry})
    new2<-reactive({
      input$update
      isolate(data.frame(LIMIT_BAL=input$limit,SEX=as.numeric(input$sex),EDUCATION=as.numeric(input$educ),
                                             MARRIAGE=as.numeric(input$marry),AGE=input$age,PAY_6=as.numeric(input$payhist),
                                             BILL_AMT6=input$prevpay,PAY_AMT6=input$lastbill))
      })
    p <- reactive({
      input$update
      predict(ccmod,newdata=new2(),type='response')})
    output$oid9=renderText({
      if(p()>=.5)"This person has a high chance of defaulting on their next payment"
      else "This person has a high chance of making their next payment"
      })  
  }
)
