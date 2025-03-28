library(ggplot2)

message("Creating plot")
p = ggplot(data, aes(x = category, y = value)) +
  geom_boxplot() +
  theme_minimal()

png("output/plot.png")
print(p)
dev.off()
