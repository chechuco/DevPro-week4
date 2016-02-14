# develope R product, week4assignment 
#setwd('/Users/YC/github/DevPro-week4')
# install an older version of shiny
#devtools::install_github("rstudio/shiny-incubator", ref = "0f343efe9b6c255e6687aaa52b5443cf975f96e7")
# progressInit issue
#devtools::install_github('rstudio/rsconnect')
library(shiny)
library(shinyIncubator)
library(googleVis)
#library(rsconnect)
#rsconnect::setAccountInfo(name="<ACCOUNT>", token="<TOKEN>", secret="<SECRET>")
#deployApp()
progressInit= function () {
    addResourcePath("progress", system.file("progress", package = "shinyIncubator"))
    tagList(singleton(tags$head(tags$script(src = "progress/progress.js"), 
                                tags$link(rel = "stylesheet", type = "text/css", href = "progress/progress.css"))))
}

shinyUI(fluidPage(
    headerPanel("San Francisco Crime Data"),
    mainPanel(
        p("This", a(href="http://shiny.rstudio.com/", "Shiny"),
          "application let you know crime incidents in SF, CA from 12/24/2015 to 12/26/2015. You can map crimes on map by category and find hour distribution."),
p("The SF crime data is from", a(href="https://data.sfgov.org/Public-Safety/SFPD-Incidents-from-1-January-2003/tmnf-yvry", "here"), ". The source code for the application is available on", a(href="https://github.com/arcadianlyric/DevPro-week4", "GitHub"), "."),
        progressInit(),
        htmlOutput("gvis")
        ),
    sidebarPanel(
        checkboxGroupInput("crime_categories", label="Select one or more categories of crime to show on map.", c("ARSON" ="ARSON", "ASSAULT" ="ASSAULT", "BAD CHECKS" ="BAD CHECKS", "BRIBERY" ="BRIBERY", "BURGLARY" ="BURGLARY", "DISORDERLY CONDUCT" ="DISORDERLY CONDUCT", "DRIVING UNDER THE INFLUENCE" ="DRIVING UNDER THE INFLUENCE", "DRUG/NARCOTIC" ="DRUG/NARCOTIC", "DRUNKENNESS" ="DRUNKENNESS" ,"EMBEZZLEMENT" ="EMBEZZLEMENT", "EXTORTION" ="EXTORTION", "FAMILY OFFENSES" ="FAMILY OFFENSES", "FORGERY/COUNTERFEITING" ="FORGERY/COUNTERFEITING", "FRAUD" ="FRAUD", "GAMBLING" ="GAMBLING" ,"KIDNAPPING" ="KIDNAPPING", "LARCENY/THEFT" ="LARCENY/THEFT", "LIQUOR LAWS" ="LIQUOR LAWS", "LOITERING" ="LOITERING","MISSING PERSON" ="MISSING PERSON", "NON-CRIMINAL"="NON-CRIMINAL" ,"OTHER OFFENSES" ="OTHER OFFENSES", "PORNOGRAPHY/OBSCENE MAT" ="PORNOGRAPHY/OBSCENE MAT", "PROSTITUTION" ="PROSTITUTION", "ROBBERY" ="ROBBERY" , "RUNAWAY" ="RUNAWAY", "SECONDARY CODES" ="SECONDARY CODES", "SEX OFFENSES, FORCIBLE" ="SEX OFFENSES, FORCIBLE", "SEX OFFENSES, NON FORCIBLE" ="SEX OFFENSES, NON FORCIBLE", "STOLEN PROPERTY" ="STOLEN PROPERTY", "SUICIDE" ="SUICIDE" , "SUSPICIOUS OCC" ="SUSPICIOUS OCC", "TREA" ="TREA", "TRESPASS" ="TRESPASS", "VANDALISM" ="VANDALISM" ,"VEHICLE THEFT" ="VEHICLE THEFT", "WARRANTS" ="WARRANTS", "WEAPON LAWS" ="WEAPON LAWS")))
))