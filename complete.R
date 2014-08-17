complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        l <- length(id)
        result <- data.frame(id = 1:l, nobs = 1:l)
        source("openspecdata.R")
        
        for(i in 1:l) {
                
                data <- openspecdata(i, id, directory)     
                
                good <- complete.case(data[[sulfate]], data[[nitrate]])
                x <- c(x, data[[pollutant]][good])
        }
        mean <- mean(pollut, na.rm = TRUE)
        mean

}