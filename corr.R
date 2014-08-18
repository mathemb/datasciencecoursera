corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        source("complete.R")
        compl <- complete(directory)
                
        l <- length(compl$id)
        #l2 <- length(compl$nobs[compl$nobs >= threshold])
        #cr <- numeric(length = l)
                        
        for(i in 1:l) {
                if (compl$nobs[i] > threshold) {
                        data <- openspecdata(i = compl$id[i], directory = directory)
                        good <- complete.cases(data)
                        dataclean <- data[good,]
                        cr[i]  <- cor(dataclean$sulfate, dataclean$nitrate)   
                } else {
                        cr[i] <- NA
                }
        }
        bad <- is.na(cr)
        cr[!bad]
}
