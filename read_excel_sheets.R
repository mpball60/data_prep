#install the readxl package (if necessary)
#install.packages("readxl")
#load the readxl package
library(readxl)

#define a function to read all sheets of an excel workbook and assign them to individual objects
read_excel_sheets <- function(filename, new_names) {
  #pull the sheet names from the excel file
  sheets <- excel_sheets(filename)
  
  #loop through each sheet, read its data, and assign it to a new object
  for (i in seq_along(sheets)) {
    #read the sheet data
    sheet_data <- read_excel(filename, sheet = sheets[i], col_types = "text", .name_repair = "unique")
    
    #assign the sheet data to an object
    assign(new_names[i], sheet_data, envir = .GlobalEnv)
  }
}

#define the file name and the new names for each sheet
filename <- "C:/your/file/path/here"
new_names <- c("XXX", "XXX", "XXX")

#calling the function
read_excel_sheets(filename, new_names)