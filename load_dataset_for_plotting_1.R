
# 1) If not present, download and unzip dataset
if (!file.exists('household_power_consumption.txt')) {
  download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                destfile='household_power_consumption.zip',
                method='curl')
  unzip('household_power_consumption.zip')
}

# 2) Memory-efficiently make a file with only rows for Dates 1/2/2007 and 2/2/2007
#    (unless already present)
if (!file.exists('household_power_consumption_filtered.txt')) {
  print('Creating a filtered file')
  input_file <- file('household_power_consumption.txt', 'r')
  output_lines <- readLines(input_file, n=1) # Read and store header
  while (length(one_line <- readLines(input_file, n=1)) > 0) {
    if (substr(one_line, 1, 8) == '1/2/2007' | substr(one_line, 1, 8) == '2/2/2007') {
      output_lines <- c(output_lines, one_line)
    }
  }
  close(input_file)
  cat(output_lines, file = 'household_power_consumption_filtered.txt', sep = '\n')
}
# Read the filtered datafile (containing only values for 1/2/2007 and 2/2/2007)
dataset <- read.table('household_power_consumption_filtered.txt',
                      header=TRUE, sep=';', as.is=TRUE, na.strings="?")

# 3) Convert the Date and Time variables to Date/Time classes in R
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), '%d/%m/%Y %X')
