#Write a function that reads a directory full of files and reports the number of 
#completely observed cases in each data file. The function should return a data 
#frame where the first column is the name of the file and the second column is 
#the number of complete cases.

complete <- function(directory,id = 1:332) {
    all_files <- list.files(directory,full.names = TRUE)
    nobs_list <- vector()
    for (i in id){
        dataset <-read.csv(all_files[i])
        naR <- na.omit(dataset)
        nobs_list <- c(nobs_list,nrow(naR))
    }
    data <- data.frame(id=id,nobs=nobs_list)
    print(data)
}

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
