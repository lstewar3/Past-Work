#Lyle A. Stewart

# Download and manipulate data from a CSV file - note this example would also work using an R CRAN dataset for this example, the file is named example.csv | I will save the dataset file to the object "vv" and analyze. 

#(1) : Download file to local directory
#(2) : Change R working directory to the directory in which the file is located (if you downloaded a data set from the internet, your file will probaby be under the c:/ drive, downloads, file.)

    #(i) Check your current directory 

getwd() # this will show you what working directory you are currently in 
  
    #(ii) Change your working directory to the directory containing the file
         #a. in the Rstudio IDE you simply move to the "files" console, click more, and select set as working directory
         #b. in R , select file, and click change dir 

#(3) Assign the file to a environment object 

vv <- read.csv("example.csv") # this will read the data into R in an array much like excel would open the csv and separate columnns according to the dilimeters. comma is the dilimeter in a csv. NOTE That I use the assignment operator to initiate the object vv as the symbol for the data. THIS allows me to easily call functions on the dataset without having to keep "reading" it in. 
class(vv) # check to see what class my data is. should be dataset

#(4) Exculde the missing values from analyses *not always necesary* 

vv[!complete.cases(vv),] # returns logical vector indicating which cases are complete "which rows have any NA values"
missing <- is.na(v[,1]) # note this does almost the same thing as the above function, except it finds how many missing values are in the first column only
newdata <- na.omit(vv) # this creates a new dataset without missing data
v <- newdata # this creates a new object named v that is equal to the new data set, easier to read
dim(vv[!complete.cases(vv),])# will return the number of rows and columns of missing values in the original dataset

#(5) Analysis - Acquire info about the dataset, look for trends.

summary(v) #great place to start, find out mean,med,max,min,and quartiles for variables
RowNames(v)# I use this to see how many "observations" or rows are in the dataset. I can also use dim function to see # of rows. 
colnames(v)# I use this to what the column names are. These are unique identifiers. 
rowMeans(vv,na.rm=TRUE) # returns row means of original dataset but omits NA values
colMeans(vv,na.rm=TRUE) #returns column means of original dataset but omits NA values *good to use if you dont want to create a whole new dataset without missing values*

#(6) Analysis - Rows and Column Commands 

vv[1:2,] #extract first two rows and all columns 
vv[c(1,3),] # extract first and third row and all columns
vv[1:2,2:3] # extract first and second row and second and third column
vv[,c(1,3)] # extract first and third columns all rows 

#(7) Analyis - Detailed Questionns 

#---- (a) Find the mean of a column on values where 1 column is above 30 and the other column is above 80
ls() #check to see what objects you have in your environment
q <- subset(vv,Column_name1 >30 & Colume_name2 >80) # extracts subset of rows of the data frame where column_name1 is values are above 30 and column_name2 values are above 80. assign this to the object q so that you may call functions easily. Notice I used the original data set vv with omitted values just because I wanted too. The new dataset could be used as well
z <- numeric(6) # create a vector of length 6 to fill with the mean of each column in the datafram, exculuding missing values 
for (i in 1:6){#  write a for loop that iterates over columns 1 to 6 and takes the means of these columns, all rows 
    z[i] <-mean(q[,i],na.rm = TRUE)#  note here q is in the dataset point, because we only want to iterate over the columns within the decided value constraints and get the corresponding means
}
print(z) # prints out our now populated vector with column means given the decided value constraints 


#--- (b) Find the mean of a column when another column is equal to 6
ls() #check to see what objects you have in your environment
f <- subset(vv,Column_name==6) # assign subset of all values where column_name = 6 to the object f
y <- numeric(6)# create a vector of the numeric class with length six to fill with releant column values 
for (i in 1:6){
    y[i] <-Mean(f[,i],na.rm=TRUE)# remenber we are using Original data so remove NA values 
}#this 4 loop will iterate over columnns 1 through 6 and take the means.because we are using data set f instead of vv or v, we will be taking the column means given the value paramaters for other columns 
print(y) # print out the numeric vector y with its new values after the loop has finished 


#--- (c) What is maximum value of a column when another column equals 5
ls() # check your current environment variables, pick one that is not in use
qw <- subset(v,Column_name1 ==5 & !is.na(Column_name2), select=Ozone)
max(qw)


#--- (d) Calculate standard deviation of each column in the data frame excluding missing values
ls() #see what variables we have in the environment now
xs <- apply(vv,2,sd,na.rm=TRUE) # use the apply function 
xs^2 # this provides the variance because standard deviation is the square root of the variance


#--- (e) Draw a random sample of 5 rows from the data frame
set.seed(1)  ## set seed to ensure the answer is repeatable 
v[sample(nrow(v), 5), ]


#--- (f) i.e if month is a column and so is sales. Calculate the mean of sales for each month in the data frame and create a vector containing monthly sales 
tapply(dataset$Sales, dataset$Month, mean, na.rm = TRUE)


#(8) Analyis - Other Commmands/Functions Misc. 

as.data.frame(v[,1]) # will extract and print column 1 with all rows as a dataframe as opposed to a numeric vector  
v[2,3] # this is a command to extract an element at row 2 and column 3

#(9) Write results to new CSV File 
getwd() # check what directory you are currently in. This is where your file will save 
file.creaate("test.csv")# will create an empty csv file named test in your working directory 
write.csv(v,"test,csv") # will write your data set *remember v is new dataset without missing values* to the test.csv file, you would probably want to upload your orginial dataset with missing values if you want to analyze in excel or use another program to continue your analysis/reporting
