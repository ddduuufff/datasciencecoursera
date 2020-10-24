setwd("/Users/ericduford/Rprojects/datasciencecoursera")

#checking for data directory and downloading file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- ""
download.file(fileUrl, destfile = "./data/", method = "curl")
week3_data <- read.csv("./data/")