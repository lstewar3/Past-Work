#Insert_Data_Set_Name Analysis

#(1) Pick R data set to analyze 
data() #this opens the list of available R data sets

#(2) Once you have selected your data set. Open the code below in an r script and hit ctrl+F. This will start the search prompt. Search for Insert_Data_Set_Name and replace it with the name of your chosen dataset. 

library(datasets) #download dat from CRAN
data(Insert_Data_Set_Name) #loads data into workspace
?Insert_Data_Set_Name #provides information on the Data
ls() #find out what varibles are in your environment
rm(list=ls()) #delete all variables from environment 
m <- Insert_Data_Set_Name # assign data set to object named m to save time.  
row.names(m) #figure out how many observations the data has. Note this is also shown when you type ?Insert_Data_Set_Name . But it helps to see what you are working with 
colnames(m) #good practice to execute this function, but summary call below will show columns as well
summary(m)# this will print off the mean,median, min, max, first and second quartiles of each column variable

#(3) You may now run the program with the selected data set. 
