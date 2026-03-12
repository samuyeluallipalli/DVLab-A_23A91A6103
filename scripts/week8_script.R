data(mtcars)

str(mtcars)

head(mtcars)

heatmap(as.matrix(mtcars))

heatmap(as.matrix(mtcars), main="Heatmap of mtcars dataset")

colors <- colorRampPalette(c("blue", "yellow", "red"))(50)
heatmap(as.matrix(mtcars), col= colors, main="Custom Color Heatmap")

corr_matrix <- cor(mtcars)
heatmap(corr_matrix, col = colorRampPalette(c("blue", "white", "red"))(50),

main = "Correalation Heatmap of mtcars")

library(reshape2)

mtcars$Car <- rownames(mtcars)

mtcars_long <- melt(mtcars, id.vars = "Car")

