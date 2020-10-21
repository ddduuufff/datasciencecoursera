library(data.table)
install.packages("readxl")
library("readxl")
library(readxl)
setwd("/Users/ericduford/Rprojects/datasciencecoursera/")

#check to see if data directory exists. If it does not it will create one
if (!file.exists("data")) {
        dir.create("data")
}

#pulling files for question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/property_data.csv", method = "curl")
#date downloaded
dateDownloaded <- date()

#creating a data table for the property data
property_dt <- read.table("./data/property_data.csv", sep = ",", header = TRUE)

#question 1
property_dt[property_dt$"VAL" == '$1000000+']


nrow(filter(property_dt,VAL == 24))
        
property_dt %>% 
        select(FES) %>%
        View()

 #question 3 

#download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/gas_data.xlsx", method = "curl")
#date downloaded
dateDownloaded <- date()

#read in the file
gas_data <- readexcel("./data/gas_data.xlsx", sheetIndex = 1, header = TRUE)
36534720

