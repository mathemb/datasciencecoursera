openspecdata <- function(i, id = 1:332, directory = "specdata") {
        if (id[i] < 10) {
                tempname <- paste("00", id[i], ".csv", sep = "")
        } else if (id[i] < 100) {
                tempname <- paste("0", id[i], ".csv", sep = "")
        } else if (id[i] < 333) {
                tempname <- paste(id[i], ".csv", sep = "")
        } else {
                print("no Monitor past ID number 332")
                break
        }
        filename <- paste(directory, tempname, sep = "/")
        data <- read.csv(filename)
}