# To avoid repeating the same code for every plot, the code for reading the data
# is written as a function and saved in the file 'readData.R'.

# Get data
source("readData.R")
data <- readData() 


# The first plot is a histogram of the household global minute-averaged active 
# power (in kilowatt)

png(file="plot1.png", height=480, width = 480) # Open png device

hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off() # Close png device

