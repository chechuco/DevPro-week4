# develope R product, week4assignment 
setwd('/Users/YC/github/DevPro-week4')
#install.packages("devtools")
#devtools::install_github("shiny-incubator", "rstudio")

library(shiny)
library(shinyIncubator)
library(googleVis)

# SF crime data from https://data.sfgov.org/Public-Safety/SFPD-Incidents-from-1-January-2003/tmnf-yvry
# filtered out 2015 incidents
# preprocess data
sf= read.csv("sf-2015-dec.csv", na.strings="")

# Format lattitude and longitude
sf$loc= paste(sf$Y, ':', sf$X, sep='')
sf$detail= paste(sf$Category, "on", as.character(sf$Date), "at", as.character(sf$Time))

# set app
shinyServer(function(input, output, session) {
    output$gvis= renderGvis({
         withProgress(session, {
            setProgress(message = "Calculating, please wait",
                        detail = "This may take a while...")
            
            sf.crime= sf[(sf$Category %in% input$crime_categories), ]
            
            gvisMap(sf.crime, "loc", "detail",
                    options=list(showTip=TRUE, 
                                 showLine=TRUE, 
                                 enableScrollWheel=TRUE,
                                 mapType='terrain', 
                                 useMapTypeControl=TRUE))
        })
    })
})