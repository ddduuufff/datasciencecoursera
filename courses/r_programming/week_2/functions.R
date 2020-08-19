setwd("/Users/ericduford/Rprojects/datasciencecoursera/data/")
eric_apps()

#Pollutant Mean Function
pollutantmean <- function(directory, pollutant, id = 1:332) {
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  values <- numeric()
  
  for (i in id) {
    data <- read.csv(filelist[i])
    values <- c(values, data[[pollutant]])
  }
  
  mean(values, na.rm = TRUE)   
}

pollutantmean("specdata", "sulfate", 1:10)



#Complete Function
complete <- function(directory, id = 1:332) {
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  nobs <- numeric()
  
  for (i in id){
    data <- read.csv(filelist[i])
    nobs <- c(nobs, sum(complete.cases(data)))
  }
  data.frame(id, nobs)
}

complete("specdata", 4:13)

#Correlation function
corr <- function(directory, threshold = 0){
  filelist <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  df <- complete(directory)
  ids <- df[df["nobs"] > threshold, ]$id
  corrr <- numeric()
  for(i in ids) {
    mydata <- read.csv(filelist[i])
    dff <- mydata[complete.cases(data)]
    corrr <- c(corrr, cor(dff$sulfate, dff$nitrate))
  }
  return(corrr)
}



corr <- function(directory, threshold = 0) {
 id = 1:332
 filename <- list.files(directory, full.names = TRUE)

 result <-vector(mode="numeric", length=0)
 
 for(i in seq(filename)) {
   airquality <- read.csv(filename[i])
   good <- complete.cases(airquality)
   airquality <- airquality[good, ]
   if (nrow(airquality) > threshold) {
     # We need [[]] around pollutant instead of [] since airquality["sulfate"]
     # is a data.frame but we need a vector here. Hence, [[]]. Please note thatusing either
     #[[]] or [] gives the same results as the test cases
     correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
     result <- append(result, correlation)
     #print(correlation)
     }
  }
   result
}

