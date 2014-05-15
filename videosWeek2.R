#### Exploratory Data Analysis Video :: Week 2
## Video 1
# Lattice Plots
Lattice builds on grid package
create all plot all at once cannot annotate afterwards

xyplot
bwplot
hsitogram
stripplot
dotplot 
splom
levelplot
contourplot


xyplot(y ~ x | f * g, data)
f and g are conditioning variables
f*g is the interaction between variables
data is the data frame

# Eaxmple
library(lattice)
library(datasets)
xyplot(Ozone ~ Wind, data = airquality)

airquality <- transform(airquality, Month = factor(Month))
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))


lattice plots return obj called trellis
print (trellis) does all the work
you can save the plot object into a variable called p

p <- xyplot(Ozone ~ Wind, data = airquality)
print(p)


## Video 2

# Panel Functions
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each=50)
y <- x+f-f*x+rnorm(100, sd=0.5)
f <- factor(f, labels=c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2,1) )

# Custom Panel function
# Make horizontal line in each panel
xyplot(x~y | f, panel = function(x,y, ...) { 
            panel.xyplot(x,y, ...)
            panel.abline(h = median(y), lty = 2)
      }
)

# Diagonal line
xyplot(x~y | f, panel = function(x,y, ...) { 
      panel.xyplot(x,y, ...)
      panel.lmline(x, y, col = 2)
}
)

!Factors makes the different panels!


## Video 3
ggplot2 PART 1
Grammer of graphics 2
Third mode of graphics in R



qplot
aesthetics (size, shape, colour)
geoms(points, lines)

factors indicates subsets of data in data frame (eg Group 1, Group 2)
ggplot()

install.packages("ggplot2")

library(ggplot2)
str(mpg)

qplot(displ, hwy, data=mpg)
x = displ
y = hwy
dataframe = mpg

# Colours and auto legend
qplot(displ, hwy, data=mpg, color = drv)

# Spline
qplot(displ, hwy, data=mpg, geom = c("point","smooth"))

# Hist, only specify 1 variable
qplot(displ, data=mpg, fill = drv)

# Panel Plots
# Horizontal
qplot(displ, hwy, data=mpg, facets = . ~ drv)

facets = rows ~ panels

# Vertical stacked panels with column chart
qplot(hwy, data=mpg, facets = drv ~ ., binwidth = 2)

# Density Smooth
qplot(hwy, data=mpg, facets = drv ~ ., binwidth = 2, geom="density", color=drv)

qplot(hwy, data=mpg, facets = drv ~ ., binwidth = 2, shape = drv)

# Linear regression
qplot(displ, hwy, data=mpg, geom = c("point","smooth"), method = "lm", facets = .~drv)


## Video 4
# ggplot2 PART 3

facets = conditional plots
stats = stats transformations
scales = what scale
coord system

1. plot data
2. overlay summary
3. metadat annotation

## Build up layers
# 1. Set data frame and important vairables, no plot yet
g <- ggplot(mpg, aes(displ, hwy))
print(g) # see no plot

## Now add some points to the plot with geom_plot
p <- g + geom_point()
print(p)


## Video 5
# ggplot PART 4

p <- g + geom_point()
print(p)

# Add a smooth
g + geom_point() + geom_smooth()

# custom smooth
g + geom_point() + geom_smooth(method = "lm")

#  Add facets (Panel Graph)
g + geom_point() +facet_grid(. ~ drv) + geom_smooth(method = "lm")

xlab(), ylab(), labs(), ggtitle()

theme()
e.g. theme(legned.position = "topright")
theme_gray()
theme_bw()

# change things, like colours
g + geom_point(color = "steelblue", size=4, alpha = 0.5) 
g + geom_point(aes(color = drv) , size=4, alpha = 0.5) 



# Labels
g + geom_point(aes(color = drv) , size=4, alpha = 0.5) + 
      labs(title = "My Title") + labs(x = "some x axis") + labs(y = "some y axis")

# Custom Smoothing
g + geom_point(aes(color = drv) , size=4, alpha = 0.5)  + geom_smooth(size = 4, linetype = 21, 
            method = "lm", se = FALSE)
            + theme_gray(base_family = "Times")
# se = FALSE (turns off confidence intervals)





## Video 6
# ggplot2 PART 5
# Outliers

data <- data.frame(x = 1:100, y = rnorm(100))
data[50,2] <- 100 ## Outlier!
plot(data$x, data$y, type="l", ylim = c(-3,3))

# plots outliers too!, no good
g <- ggplot(data, aes(x=x,y=y))
g + geom_line()

# To zoom in on graph do this, dont have to look at outlier now
g + geom_line() + coord_cartesian( ylim = c(-3,3))

# Use cut() to cut the data into some buckets
cutpoints <- quantile(data$y, seq(0,1, length=4), na.rm=TRUE)
data$no2dec <- cut(data$y, cutpoints)

levels(data$no2dec)

## Mad boobs graph
g <- ggplot(maacs, aes(logpm25, nocturnalSympt))
# add layers
g     + geom_point(alpha = 1/3)
      + facet_wrap(bmicat ~ no2dec, nrow = 2m ncol = 4)
      + geo_smooth(method = "lm", se=FALSE, col = "steelblue")
      + theme_bw(base_family = "Helvetica", base_size = 10)
      + labs(x = )
      + labs(y = )
      + labs(title = )







