# Load necessary packages (install if not already loaded)
packages <- c("dplyr", "RSQLite", "ggplot2")
install_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if (length(install_packages)) install.packages(install_packages)
lapply(packages, library, character.only = TRUE)
library(tidyr)


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

# Set the order of the days of the week
day_order <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
result_clean$week_day <- factor(result_clean$week_day, levels = day_order)

# Bar plot with membership type for the day of the week
ggplot(result_clean, aes(x = week_day, fill = member_casual)) +
  geom_bar(position = "dodge", alpha = 0.7) +
  labs(title = "Frequency of Week Day by Membership Type",
       x = "Day of the Week",
       y = "Frequency",
       fill = "Membership Type") +
  theme_minimal()

# Calcular la columna total_trips sumando las columnas Saturday y Sunday
weekend_pivot <- weekend_counts %>%
  pivot_wider(names_from = week_day, values_from = trip_count) %>%
  mutate(total_trips = Saturday + Sunday)

# Ordenar la tabla por total_trips en orden descendente
weekend_pivot <- weekend_pivot %>%
  arrange(desc(total_trips))

# Imprimir las primeras 10 filas
print(head(weekend_pivot, 5))

# Filtrar solo los usuarios casuales
casual_data <- result_clean[result_clean$member_casual == "casual", ]

# Obtener las 5 estaciones con más viajes
top_stations <- casual_data %>%
  group_by(start_station_name) %>%
  summarise(total_trips = n()) %>%
  arrange(desc(total_trips)) %>%
  head(5)

# Filtrar los datos para incluir solo las 5 estaciones principales
casual_top_stations <- casual_data[casual_data$start_station_name %in% top_stations$start_station_name, ]

# Convertir week_day a factor con orden específico
casual_top_stations$week_day <- factor(casual_top_stations$week_day, levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Crear un gráfico de barras
bar_plot <- ggplot(casual_top_stations, aes(x = start_station_name, fill = week_day)) +
  geom_bar(stat = "count", position = "dodge", alpha = 0.7) +
  labs(title = "Trips on Saturday and Sunday for Top 5 Stations (Casual Users)",
       x = "Start Station Name",
       y = "Number of Trips",
       fill = "Day of the Week") +
  scale_fill_manual(values = c("Saturday" = "skyblue", "Sunday" = "lightcoral")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotar etiquetas del eje x para mejor legibilidad

# Imprimir el gráfico
print(bar_plot)
