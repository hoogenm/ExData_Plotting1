
# Read the data.
# Note: the code for loading the dataset would be repetitive
#       and hard to maintain if copied, so it is sourced from a
#       separate file (which is of course in the repo)

source('load_dataset_for_plotting_1.R')

png('plot4.png', width=480, height=480)

par(mfrow=c(2,2))

# Topleft

plot(x=dataset$DateTime, y=dataset$Global_active_power, type="l",
     xlab='',
     ylab="Global Active Power")

# Topright

plot(x=dataset$DateTime, y=dataset$Voltage, type="l",
     xlab='datetime',
     ylab="Voltage")

# Bottomleft

plot(x=dataset$DateTime, y=dataset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=dataset$DateTime, y=dataset$Sub_metering_2, col="red")
lines(x=dataset$DateTime, y=dataset$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=0.88)

# Bottomright

plot(x=dataset$DateTime, y=dataset$Global_reactive_power, type="l",
     xlab='datetime',
     ylab="Global_reactive_power")

dev.off()

# NOTE: if you are running this on a 'non-english' computer, setting the locale
#       might be necessary to get correct X-labels, e.g. on Ubuntu Linux use:
# Sys.setlocale("LC_TIME", "en_US.UTF8")
