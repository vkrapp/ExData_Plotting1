# The function 'readData' reads data of the "Individual household electric power 
# consumption Data Set" from the UC Irvine Machine Learning Repository, a popular 
# repository for machine learning datasets. The function combines the Date and 
# Time variables to a variable called 'datetime' and returns the data of the
# dates 2007-02-01 and 2007-02-02. 
# If the file does not exist in the current working directory, the function will 
# download the file.

# Data description: Measurements of electric power consumption in one household 
# with a one-minute sampling rate over a period of almost 4 years. Different 
# electrical quantities and some sub-metering values are available.

readData <- function(){
    
    # Set time of sytstem to English format
    Sys.setlocale("LC_TIME", "English")
    
    # Name of file
    filename = "household_power_consumption.txt"
    
    # Download data if file does not exist
    if(!file.exists(filename)){
        
        #Link to data
        fileUrl <- paste0("https://d396qusza40orc.cloudfront.net/exdata%2F",
                          "data%2Fhousehold_power_consumption.zip")
        
        # Name of zipfile in which data is stored
        zipfile <- "household_power_consumption.zip"
        
        # Download file
        download.file(fileUrl, destfile=zipfile)
        datedownload <- date() ## Downloaded on Fri Jan 09 11:13:21 2015
        cat(filename, "was downloaded on",  datedownload)
        
        # Unzip data and delete zipfile
        unzip(zipfile)
        file.remove(zipfile)          
    }
        
    # Read in data
    data <- read.table(filename, sep=";", header=TRUE, na.strings = "?")
    
    # Convert the Date variable to Date class
    data$Date <- as.Date(data$Date,"%d/%m/%Y")
    
    # Subset data (Data from the dates 2007-02-01 and 2007-02-02)
    data <- data[which(data$Date=="2007-02-01" | data$Date=="2007-02-02"), ]     
    
    # For the plots we need to combine the date and time 
    data$datetime <- strptime(paste(data$Date, data$Time), 
                              format="%Y-%m-%d %H:%M:%S")
    
    # Remove the Date and Time variables (first and second column)
    data <- data[ , c(-1,-2)]
    
    # Return the data
    return(data)
}