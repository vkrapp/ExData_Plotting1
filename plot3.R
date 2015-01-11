# To avoid repeating the same code for every plot, the code for reading the data
# is written as a function and saved in the file 'readData.R'.

# Get data
source("readData.R")
data <- readData()


# The third plot shows the three energy sub-meterings over the two days 
# (2007-02-01 and 2007-02-02)
# Sub_metering_1 (in watt-hour of active energy): corresponds to the kitchen, 
# containing mainly a dishwasher, an oven and a microwave (hot plates are not 
# electric but gas powered)
# Sub_metering_2 (in watt-hour of active energy): corresponds to the laundry 
# room, containing a washing-machine, a tumble-drier, a refrigerator and a light
# Sub_metering_3 (in watt-hour of active energy): corresponds to an electric 
# water-heater and an air-conditioner

png(file="plot3.png", height=480, width = 480) # Open png device

with(data, plot(datetime, Sub_metering_1, type="l", xlab="",
                ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", names(data[5:7]), lty=1, col=c("black","red","blue"))
       
dev.off() # Close png device