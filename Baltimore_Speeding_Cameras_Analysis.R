#--- CREATE AND CHECK YOUR DIRECTORY ---
getwd()

if (!file.exists("test2")){
    dir.create("test2")
} else{
    print("file exists")
}

#--- DOWNLOAD THE DATA INTO LOCAL MEMORY --- 
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./test2/cameras.xlsx", mode="wb")
# wb means we are downloading in binary mode 
dateDownloaded <- date() # Always remember the downlaod date

#--- INSTALL THE PROPER PACKAGES AND LOAD THEM INTO THE WORKSPACE ---
install.packages("xlsx")
install.pacakges("openxlsx")
library(openxlsx)
#note openXL() function will open the workbooks * remember for when you need to iterate over a directory with many files
help(package="openxlsx") # look for how to read data - see what functions are in your new package and applications 
cameraData <- read.xlsx("./test2/cameras.xlsx")
head(cameraData) # get first 6 rows 
tail(cameraData)

#--- SUBSET - READ SPECIFIC COLUMNS AND ROWS ---
cameraDataSubset <- cameraData[1:4,2:3] # extract a little part of the file

    ##An alternative way to read specific columns and rows is below; 
    #colIndex <-2:3
    #rowIndex<-1:4
    #cameraDataSubset <- read.xlsx("./test2/cameras.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)
