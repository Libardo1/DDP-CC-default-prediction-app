library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Credit Card Default Prediction"),
  sidebarPanel(
    h3('Please Enter Client Attributes Here:'),
    sliderInput('limit', 'Spending Limit', 0, min = 0, max = 1000000, step = 1),
    numericInput('age', 'Age', 0, min=0, max=500, step = 1),
    radioButtons('sex',"Click sex",c("Male"=1, "Female" = 2)),
    radioButtons('educ',"Click education level",c("Graduate School"=1,'University'=2,
                                                  "High School" =3, 'Other'=4)),
    sliderInput('lastbill',"Amount of last bill",0, min=0,max=1000000, step=1),
    sliderInput('prevpay', "Amount of last previous payment", 0,min=0,max=100000, step=1),
    radioButtons('payhist', "Delinquency of payment",c('paid up'= -1, '1 month' =1,'2 months'=2,
                                                       '3 months'= 3, '4 months'=4,'5 months'=5,
                                                       '6 months'= 6, '7 months'=7, '8 months'=8,
                                                       '9 months'=9)),
    radioButtons('marry',"Marital Status", c('Married'=1, 'Single'=2,'Other'=3)),
    actionButton("update", "Get Prediction")
  ),
  mainPanel(
    h3('Payment Default Prediction Values Entered'),
    h4('Spending Limit'),
    verbatimTextOutput("oid1"),
    h4('Age'),
    verbatimTextOutput("oid2"),
    h4('Sex'),
    verbatimTextOutput("oid3"),
    h4('Education level'),
    verbatimTextOutput("oid4"),
    h4('Last bill amount'),
    verbatimTextOutput("oid5"),
    h4('Last previous payment'),
    verbatimTextOutput('oid6'),
    h4('Delinquency of payment'),
    verbatimTextOutput('oid7'),
    h4('Marital Status'),
    verbatimTextOutput('oid8'),
    h4('Credit Default Prediction'),
    tableOutput('oid9')
    
  )
))