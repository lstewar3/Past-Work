Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows



corr <- function(directory,threshold=0){
    fcorr <- function(fun){
        data <- read.csv(file.path(directory,fun))
        nobs <- sum(complete.cases(data))
        if(nobs>threshold){
            return (cor(data$nitrate, data$sulfate, use="complete.obs"))
        }
    }
    fcorrs <- sapply(list.files(directory), fcorr)
    fcorrs <- unlist(fcorrs[!sapply(fcorrs,is.null)])# take out the NULLS
    return (fcorrs)
}
