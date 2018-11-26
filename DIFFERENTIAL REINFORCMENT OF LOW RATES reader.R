#First, download and install the "stringr" package

library("stringr") #This package is used to extract and manipulate data

#This part selects the file containing the MED-PC output file from a single session in the differential reinforcment of low rates task and names it
#IMPORTANT NOTE: MED-PC output files should be saved as .txt in order for this program to work
data<- read.delim (file.choose(), header=T)
colnames(data) <- c("Data")

#This section extracts numerical data from the text files 
data_extracted<-data[-c(0:10), "Data"] #In this case, the relevant variables are stored from line 11 onwards on the .txt file
num_loc <- str_extract_all (data_extracted, "([0-9]{1,})[- .]([0-9]{3})")
#The last line of code extracts the data that follows the pattern of at least one digit followed by a point and at least on digit

#Setting the data as numerical data for statistical use
num_unlist<-unlist(num_loc)
no_number<-as.numeric(num_unlist)

#Creating and naming a matrix containing said data
matrix_no_number<-matrix(no_number, nrow=, ncol=1)
colnames(matrix_no_number) <- c("Intertrial_intervals")

#Creating a dataframe
DRL_Dataframe<-data.frame(matrix_no_number)


