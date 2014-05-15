### Exploratory Data Analysis Quiz 2

# Q2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

# Q5
?trellis.par.set
?par

# Q7
library(datasets)
data(airquality)

qplot(Wind, Ozone, data = airquality, geom = "smooth")

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

# Q9
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
g+ geom_point()
print(g)

qplot(votes, rating, data = movies)
qplot(votes, rating, data = movies, smooth = "loess")
qplot(votes, rating, data = movies) + stats_smooth("loess")
qplot(votes, rating, data = movies) + geom_smooth()