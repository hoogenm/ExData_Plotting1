
# Read the data.
# Note: the code for loading the dataset would be repetitive
#       and hard to maintain if copied, so it is sourced from a
#       separate file (which is of course in the repo)

source('load_dataset_for_plotting_1.R')

# background transparent (as in Roger Peng's repo)
png('plot3.png', width=480, height=480, bg="transparent")

plot(x=dataset$DateTime, y=dataset$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=dataset$DateTime, y=dataset$Sub_metering_2, col="red")
lines(x=dataset$DateTime, y=dataset$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))

dev.off()

# NOTE: if you are running this on a 'non-english' computer, setting the locale
#       might be necessary to get correct X-labels, e.g. on Ubuntu Linux use:
# Sys.setlocale("LC_TIME", "en_US.UTF8")
