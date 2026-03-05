#Load dataset
data(HairEyeColor)

#Check structure
str(HairEyeColor)

View(HairEyeColor)

?HairEyeColor

mosaicplot(HairEyeColor)

mosaicplot(HairEyeColor, main="Mosaic Plot: Hair, Eye Color and Sex",
           color = TRUE)


#Two _variables Mosiac Plot
HairEye2D<-margin.table(HairEyeColor, c(1,2))
mosaicplot(HairEye2D, main = "Hair vs Eye Color Mosaic Plot", color = TRUE)
#Mosaic Plots by Sex

par(mfrow= c(1, 2))
mosaicplot(HairEyeColor[,, "Male"], main="Male", color = TRUE)
mosaicplot(HairEyeColor[,, "Female"], main="Female", color = TRUE)
par(mfrow= c(1,1))

#custom colors
mosaicplot(HairEye2D,col=c("brown", "black", "red", "yellow"), main= "Hair vs Eye Color(Custom Colors)")
install.packages("vcd")
library(vcd)

mosaic(HairEyeColor, shade=TRUE,legend=TRUE, main="Shaded Mosaic Plot(vcd)")

#Convert Database to Data Frame (For ggplot)
hair_eye_df<- as.data.frame(HairEyeColor)
head(hair_eye_df)
library(ggplot2)
ggplot(hair_eye_df, aes(x=Hair, y=Freq, fill=Eye))+
  geom_bar(stat="identity", position="fill") + 
  facet_wrap(~Sex) + 
  labs(
    title= "Proportional Distribution of Eye Color by Hair",
    y = "Proportion"
  ) + 
  theme_minimal()
#Advanced Mosaic with Residual Shading
mosaic(~Hair + Eye + Sex, data = hair_eye_df, shade = TRUE, legend=TRUE)
