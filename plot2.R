# To avoid repeating the same code for every plot, the code for reading the data
# is written as a function and saved in the file 'readData.R'.

# Get data
source("readData.R")
data <- readData()


# The second plot shows the household global minute-averaged active power (in 
# kilowatt) over the two days (2007-02-01 and 2007-02-02)

png(file="plot2.png", height=480, width = 480) # Open png device

with(data, plot(datetime, Global_active_power, type="l", xlab="",
                ylab="Global Active Power (kilowatts)"))

dev.off() # Close png device
