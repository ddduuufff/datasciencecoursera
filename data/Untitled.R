setwd("/Users/ericduford/Rprojects/datasciencecoursera/data/")
eric_apps()


pollutantmean <- function(directory, pollutant, id = 1:332) {
     fileList <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
     values <- numeric()
     
     for (i in id) {
       data <- read.csv(fileList[1])
       values <- c(values, data[[pollutant]])
     }
  mean(values, na.rm = TRUE)   
}
pollutantmean("specdata", "sulfate", 1:10)
