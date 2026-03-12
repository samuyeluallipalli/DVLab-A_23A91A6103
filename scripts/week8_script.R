# Load dataset
data(mtcars)

# Structure of dataset
str(mtcars)

# First rows
head(mtcars)

# Basic heatmap
heatmap(as.matrix(mtcars))

# Heatmap with title
heatmap(as.matrix(mtcars), main="Heatmap of mtcars Dataset")

# Custom colors
colors <- colorRampPalette(c("blue","yellow","red"))(50)
heatmap(as.matrix(mtcars), col=colors, main="Custom Color Heatmap")

# Correlation matrix
corr_matrix <- cor(mtcars)

# Correlation heatmap
heatmap(corr_matrix,
        col=colorRampPalette(c("blue","white","red"))(50),
        main="Correlation Heatmap of mtcars")

# Install package
install.packages("reshape2")

# Load libraries
library(reshape2)
library(ggplot2)

# Convert rownames to column
mtcars$Car <- rownames(mtcars)

# Convert wide data → long format
mtcars_long <- melt(mtcars, id.vars="Car")

# View data
View(mtcars_long)

# Heatmap using ggplot
ggplot(mtcars_long,
       aes(x=variable, y=Car, fill=value)) +
  geom_tile()

# Improved heatmap
ggplot(mtcars_long,
       aes(x=variable, y=Car, fill=value)) +
  geom_tile() +
  scale_fill_gradient(low="white", high="red") +
  theme_minimal() +
  labs(title="Heatmap of mtcars Dataset")

# Correlation matrix
corr_matrix <- cor(mtcars[, sapply(mtcars, is.numeric)])

# Convert correlation matrix to long format
corr_long <- melt(corr_matrix)

# Correlation heatmap
ggplot(corr_long,
       aes(x=Var1, y=Var2, fill=value)) +
  geom_tile() +
  scale_fill_gradient2(low="blue", mid="white", high="red", midpoint=0) +
  theme_minimal() +
  labs(title="Correlation Heatmap of mtcars")

# Correlation heatmap with values
ggplot(corr_long,
       aes(x=Var1, y=Var2, fill=value)) +
  geom_tile() +
  geom_text(aes(label=round(value,2))) +
  scale_fill_gradient2(low="blue", mid="white", high="red", midpoint=0) +
  theme_minimal()
install.packages("pheatmap")
library(pheatmap)
pheatmap(cor(mtcars[,sapply(mtcars,is.numeric)]),
         display_numbers=round(corr_matrix,2),
         main="advanced Correlation Heatmap")
