# To avoid repeating the same code for every plot, the code for reading the data
# is written as a function and saved in the file 'readData.R'.

# Get data
source("readData.R")
data <- readData()


# The fourth plot consists of 4 subplots showing the ...
#   1) household global minute-averaged active power (in kilowatt)
#   2) minute-averaged voltage (in volt)
#   3) household global minute-averaged reactive power (in kilowatt)
#   4) three energy sub-meterings 
# over the two days (2007-02-01 and 2007-02-02)

png(file="plot4.png", height=480, width = 480) # Open png device

par(mfrow=c(2,2))
with(data, {  
    plot(datetime, Global_active_power, type="l", xlab="",
         ylab="Global Active Power")
    
    plot(datetime, Voltage, type="l")
    
    plot(datetime, Sub_metering_1, type="l", xlab="",
         ylab="Energy sub metering")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", names(data[5:7]), lty=1, bty="n",
           col=c("black", "red", "blue"))
    
    plot(datetime, Global_reactive_power, type="l")    
})

dev.off() # Close png device
