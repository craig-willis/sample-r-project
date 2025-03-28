library(dplyr)

message("Creating summary output")
summary_stats <- data %>%
  group_by(category) %>%
  summarise(mean_value = mean(value))

dir.create("output", showWarnings = FALSE)

write.csv(summary_stats, "output/summary_stats.csv", row.names = FALSE)
