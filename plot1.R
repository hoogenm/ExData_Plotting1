
# Read the data.
# Note: the code for loading the dataset would be repetitive
#       and hard to maintain if copied, so it is sourced from a
#       separate file (which is of course in the repo)

source('load_dataset_for_plotting_1.R')

# background transparent (as in Roger Peng's repo)
png('plot1.png', width=480, height=480, bg="transparent")

# Plot 1
hist(dataset$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     col="red",
     main="Global Active Power")

dev.off()