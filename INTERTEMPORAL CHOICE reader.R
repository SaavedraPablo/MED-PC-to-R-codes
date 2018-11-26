#First, download and install the "stringr" package

library("stringr") #This package is used to extract and manipulate data

#This part selects the file containing the MED-PC output file from a single session in the intertemporal choice task and names it
#IMPORTANT NOTE: MED-PC output files should be saved as .txt in order for this program to work
data<- read.delim (file.choose(), header=T)
colnames(data) <- c("Data")

#This section extracts numerical data from the text files
data_extracted<-data[-c(0:9), "Data"] #In this case, the relevant variables are stored from line 10 onwards on the .txt file
num_loc <- str_extract_all (data_extracted, "([0-9][0-9]{0,})[- .]([0-0]{3})")
#The last line of code extracts the data that follows the pattern of at least one digit followed by a point and three zeros

#Setting the data as numerical data for statistical use
num_unlist<-unlist(num_loc)
no_number<-as.numeric(num_unlist)

#Creating and naming a matrix containing such data
matrix_no_number<-matrix(no_number, nrow=, ncol=1)
colnames(matrix_no_number) <- c("Frequency")

#Creating and naming a categorical matrix
type<-c("LL","SS")
type_matrix<-matrix(type, nrow=, ncol=1)
colnames(type_matrix) <- c("Type")

#Merging both matrixes and creating a dataframe
ITC_matrix<-cbind(type_matrix,matrix_no_number)
ITC_Dataframe<-data.frame(ITC_matrix)
