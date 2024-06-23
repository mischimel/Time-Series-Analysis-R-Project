#------- 1) Information from Moodle---------------------------------------------
# Series_ID = CEU1021000001
# Title = Mining and Logging: Mining

#------- 2) Access and Inspect dataset -----------------------------------------
# Install (if necessary) and Load the 'fpp3' package 
# install.packages('fpp3')
library(fpp3)

# View the 'us_employment' dataset for further inspection
view(us_employment)

#------- 3) Filter Data --------------------------------------------------------
# Load the dplyr package 

# Filter the 'us_employment' dataset based on my Series_ID
filtered_data <- us_employment %>%
  filter(Series_ID == "CEU1021000001")

# View the filtered dataset
view(filtered_data)

# Plot the filtered dataset using autoplot
autoplot(filtered_data)

#------- 4) Check and Remove NAs -----------------------------------------------
# Calculate the total number of rows in the dataset
total_rows <- nrow(filtered_data)

# Calculate and print the NA values in each column
na_counts <- colSums(is.na(filtered_data))
print(na_counts)

# Calculate and print the percentage of NA values in each column
na_percentages <- paste0(round((na_counts / total_rows) * 100, 2), '%')
print(na_percentages)

# Remove rows with NA values
filtered_data_clean <- na.omit(filtered_data)

# Check the dimensions of the cleaned dataset
print(dim(filtered_data_clean))

# Calculate and print the NA values in each column in the cleaned dataset
na_counts_1 <- colSums(is.na(filtered_data_clean))
print(na_counts_1)

#------- 5) Save the Time Series on disk ---------------------------------------
# Save the resulting time series on disk
saveRDS(filtered_data_clean, file = "filtered_data_clean.rds")



