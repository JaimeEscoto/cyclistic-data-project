# Specify the file name
file_name <- "CyclisticDataBase.db"

# Check if the file exists
if (file.exists(file_name)) {
  print(paste("The file", file_name, "exists."))
} else {
  print(paste("The file", file_name, "does not exist."))
}
# Load the necessary packages (if not already loaded)
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

# Load the dplyr package
library(dplyr)

# Install the RSQLite and ggplot2 packages if not already installed
if (!requireNamespace("RSQLite", quietly = TRUE)) {
  install.packages("RSQLite")
}

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Load the necessary packages
library(DBI)
library(RSQLite)
library(ggplot2)  # For data visualization
library(lubridate)

# Specify the location of your SQLite database
database_path <- "/Users/maletincorp/Documents/Books | Data Analyst Project/cyclistic-data-project/CyclisticDataBase.db"

# Connect to the database
mydb <- dbConnect(RSQLite::SQLite(), dbname = database_path)

# Perform a query
result <- dbGetQuery(mydb, 'SELECT * FROM bike_trips_view')  # Use the view

# Display the results
print(result)

# Check structure and types of variables
str(result)

# Count missing values
missing_values <- colSums(is.na(result))

# Visualize missing values using ggplot2
ggplot(data.frame(variable = names(missing_values), missing_count = missing_values),
       aes(x = variable, y = missing_count)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.7) +
  labs(title = "Missing Data Visualization",
       x = "Variable",
       y = "Missing Count") +
  theme_minimal()

# Remove rows with missing values
result_clean <- na.omit(result)

# Summary statistics
summary(result_clean)

# Histogram for numeric variable trip_length with adjusted range and scale
ggplot(result_clean, aes(x = trip_length)) +
  geom_histogram(fill = "green", bins = 400, alpha = 0.7) +
  labs(title = "Histogram of trip_length",
       x = "Trip Length",
       y = "Frequency") +
  xlim(0, 50) +  # Limit x-axis range
  theme_minimal()

# Boxplot to compare trip duration by membership type
ggplot(result_clean, aes(x = member_casual, y = trip_length)) +
  geom_boxplot(fill = "blue", alpha = 0.7) +
  labs(title = "Boxplot of Trip Length by Membership Type",
       x = "Membership Type",
       y = "Trip Length (minutes)") +
  ylim(0, 10) +  # Limit y-axis to 0-10 minutes to highlight differences
  theme_minimal()

# Set the order of the days of the week
day_order <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
result_clean$week_day <- factor(result_clean$week_day, levels = day_order)

# Bar plot with membership type for the day of the week
ggplot(result_clean, aes(x = week_day, fill = member_casual)) +
  geom_bar(position = "dodge", alpha = 0.7) +
  labs(title = "Frequency of week_day by Membership Type",
       x = "Day of the Week",
       y = "Frequency",
       fill = "Membership Type") +
  theme_minimal()

# Bar plot with the number of trips by month and membership type
ggplot(result_clean, aes(x = month, fill = member_casual)) +
  geom_bar(position = "dodge", alpha = 0.7) +
  labs(title = "Number of Trips by Month and Membership Type",
       x = "Month",
       y = "Number of Trips",
       fill = "Membership Type") +
  theme_minimal()

# Line plot for hourly usage by membership type
ggplot(result_clean, aes(x = as.POSIXct(started_at), group = member_casual, color = member_casual)) +
  geom_line(stat = "count") +
  labs(title = "Hourly Usage Patterns by Membership Type",
       x = "Hour of the Day",
       y = "Number of Trips",
       color = "Membership Type") +
  theme_minimal()

# Density plot for age distribution by membership type
ggplot(result_clean, aes(x = member_casual, y = birthyear, fill = member_casual)) +
  geom_density(alpha = 0.7) +
  labs(title = "Age Distribution by Membership Type",
       x = "Membership Type",
       y = "Density",
       fill = "Membership Type") +
  theme_minimal()

# Heatmap for station usage by hour of the day and membership type
ggplot(result_clean, aes(x = hour(as.POSIXct(started_at)), y = start_station_name, fill = member_casual)) +
  geom_tile() +
  labs(title = "Heatmap of Station Usage by Hour of the Day and Membership Type",
       x = "Hour of the Day",
       y = "Start Station",
       fill = "Membership Type") +
  theme_minimal()

# Heatmap for frequency of casual user trips by station, hour, and day
ggplot(result_clean[result_clean$member_casual == "casual", ],
       aes(x = hour(as.POSIXct(started_at)),
           y = start_station_name,
           fill = ..count..)) +
  geom_tile() +
  labs(title = "Heatmap of Casual User Trips by Station, Hour, and Day",
       x = "Hour of the Day",
       y = "Start Station",
       fill = "Number of Trips") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability


######
# Visualize missing values using ggplot2
ggplot(data.frame(variable = names(missing_values), missing_count = missing_values),
       aes(x = variable, y = missing_count)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.7) +
  labs(title = "Missing Data Visualization",
       x = "Variable",
       y = "Missing Count") +
  theme_minimal()
#####
# Heatmap for station usage by hour of the day and membership type
# Filter data for stations with more than 10,000 trips
stations_over_10k <- result_clean %>%
  group_by(start_station_name) %>%
  summarise(trip_count = n()) %>%
  filter(trip_count > 10000)

# Filter the original data for the selected stations
result_over_10k <- result_clean[result_clean$start_station_name %in% stations_over_10k$start_station_name, ]

# Create a bar chart using ggplot2
ggplot(result_over_10k, aes(x = reorder(start_station_name, -trip_count), y = trip_count)) +
  geom_bar(stat = "identity", fill = "coral", alpha = 0.7) +
  labs(title = "Start Stations with More Than 10,000 Trips",
       x = "Start Station Name",
       y = "Number of Trips") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability


# Correlation matrix for numeric variables
cor_matrix <- cor(result_clean[, c("trip_length", "trip_length")])

# Print correlation matrix
print(cor_matrix)

# Disconnect from the database
dbDisconnect(mydb)
