### Exploratory Data Analysis Videos :: Week 1

setwd("~/Documents/Coursera/dataScienceSpecialisation/exploratoryDataAnalysis")
## Video 1
Evidence is always relative
compared to what

## Video 2
show as many variables as makes sense
integrate words numbers images and diagrams

describe and document your evidence
quality relevance integrit og coment

1. show comparisons
2. show causality mechanim explanation
3. show multivatraite data
4. Integrate multiple modes of evidence
5. Descirbe and document evidence
6. Content is king

## Video 3
Why use graphs
1. understand data properties
2. find patterns
3. suggest modeling strategies
4. debug analyses
5. communicate results


1 - 4 == exploratory graphs

ExpGrpah= made quickly, large number, goal is personal undersatnding, 
axes and legends are general and cleaned later, color and size used for information

five number summar
boxplots
hist
density plots
barplot

## Histagrams
head(airquality)
a <- airquality

hist(a$Temp)
rug(a$Temp)


hist(a$Wind, col="green", breaks=20)
rug(a$Wind)
abline(v=12, lwd = 2)
# Put a line on the chart to represent the median
abline(v=median(a$Wind), col="magenta", lwd = 4)

boxplot(a$Temp, col="blue")
abline(h=85)      # Draws a line

# Bar plot
barplot(table(a$Month), col="wheat", main="Count of Months samples collected")


## Video 4
2D summaries
Multiple / overlayed 1-D plots
scatterplot
smooth scatter plot
spinning plot

boxplot(a ~ month, data = a$Temp, col="red" )

par(mfrow=c(2,1), mar=c(4,4,2,1))
hist(subset(a, month=="4")$Temp, col="green")
hist(subset(a, month=="5")$Temp, col="green")

with(a, plot(Ozone, Temp, col=Month))
# Puts a Dashed line
abline(h=80, lwd=2, lty=2) 

# Multiple Scatter Plots
# Set some parameters of the plot
par(mfrow=c(1,2), mar=c(5,4,2,1))
with(subset(pollution, region=="west"), plot(latitude, pm25, main="West"))
with(subset(pollution, region=="east"), plot(latitude, pm25, main="East"))


## Video 5
# base plotting sysytem
start with blank canvas and add things to it
intuitive, but cant take things away

library(datasets)
data(cars)
with(cars, plot(speed, dist))


# Lattice Plot System
xyplot, bwplot, etc....
can be awkward to use
difficult to annotate after the fact

library(lattice)
state <- data.frame(state.x77, region=state.region )
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1) )


# ggplot2 Plotting system
Mixes  lattice and base plot
easy to use than lattice
install.packages("ggplot2")
library(ggplot2)
data(mpg)
qplot(displ, hwy, data=mpg)



## Video 6
# BAse Graphics
hist(a$Ozone)
with(a, plot(Wind, Ozone))
a <- transform(a, Month=factor(Month))
boxplot(Ozone ~ Month, a, xlab="Month", ylab="Ozone (ppb)")

# Default symbols
pch plot symbol
lty line type
lwd line width
col colour
xlab x label
ylab y label

# par() -- global
las = orientation of axis labels
bg = back ground coluour
mar = margin size
oma = outer margin size
mfrow = number of plots per row/col (filled row wise)
mfcol ""


plot margin starts at bottom, then left, top, right

## Video 6
plot scatter plot
lines adds lines to plot, time series
points = adds points
text = adds labels
title 
mtext = margin text
axis = axis ticks


with(a, plot(Wind, Ozone, main="Some title"))
with(subset(a, Month==5), points(Wind, Ozone, col="blue") )

# Make unprinted plot
with(a, plot(Wind, Ozone, main="Some title"), type="n")

# Plot a regression line
with(a, plot(Wind, Ozone, main="Some title"), pch=20)
model <- lm(Ozone~Wind, airquality)
abline(model, lwd=2)

# Set 1 row, 2 cols
par(mfrow=c(1,2))
with(a, {
      plot(Wind, Ozone, main="Plot 1")
         plot(Solar.R, Ozone, main="Plot 2")
         mtext("Some graphs", outer=TRUE)
}
)
# Show all plot types
example(points)

legend("topright", legend="My Legend")

## Plotting with factors (Males and Females)
x <- rnorm(100)
y <- x+rnorm(100)
plot(x,y)
g <- gl(2,50)
g <- gl(2,50, labels=c("Male", "Female"))
str(g)
plot(x, y, type="n")
points(x[g=="Male"], y[g=="Male"], col="blue")
points(x[g=="Female"], y[g=="Female"], col="red", pch=20)

## Video 7
Graphics devices
computer screen
PDF
PNG JPEG
SVG
Mac screen device is called Quartz
?Devices

## Print to PDF
# open pdf device
pdf(file="myplot.pdf")
# make graph
with(faithful, plot(eruptions, waiting))
title(main="Old faithful geyser")
# turn off device
dev.off()


## Video 7
# Graphics devices part 2
SVG are the best for plots

current grfx device (>=2)
dev.cur()

change the active graphics dev using
dev.set(<integer>)


# Copy a plot from one device to another one
dev.copy()
dev.copy2pdf()

# make graph
with(faithful, plot(eruptions, waiting))
title(main="Old faithful geyser")
dev.copy(png, file="geyserplot.png")
# turn off device
dev.off()
dir()












