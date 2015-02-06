
# Read the data.
# Note: the code for loading the dataset would be repetitive
#       and hard to maintain if copied, so it is sourced from a
#       separate file (which is of course in the repo)

source('load_dataset_for_plotting_1.R')

# background transparent (as in Roger Peng's repo)
png('plot2.png', width=480, height=480, bg="transparent")

plot(x=dataset$DateTime, y=dataset$Global_active_power, type="l",
     xlab='',
     ylab="Global Active Power (kilowatts)") 

dev.off()

# NOTE: if you are running this on a 'non-english' computer, setting the locale
#       might be necessary to get correct X-labels, e.g. on Ubuntu Linux use:
# Sys.setlocale("LC_TIME", "en_US.UTF8")
