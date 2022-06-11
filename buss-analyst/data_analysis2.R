# The advantage of R notebooks is that it combines data processing, word processing, and data visualization.
# what characteristics of data make an asset for business purposes
# tidy df: column-feature; row-observation
# dictionary: brief overview; description of each column
# structure of df: str(df)

path_items = '/home/felipelx/Desktop/workspace/sql/buss-analyst/'
path_weather = '/home/felipelx/Desktop/workspace/sql/buss-analyst/'

dfi = read.csv('/home/felipelx/Desktop/workspace/sql/buss-analyst/jan17Items.csv',
               stringsAsFactor=FALSE, header=TRUE)
dfw = read.csv('/home/felipelx/Desktop/workspace/sql/buss-analyst/jan17Weather.csv', 
               stringsAsFactor=FALSE, header=TRUE, sep='\t')

str(dfi)
str(dfw)

v1 <- c(18:23)
v1[1]
v2 <- v1[c(1,5)]
v2

dfw[1:6, 1:3] # first 6 rows, first 3 columns
dfw$date
dfi$BarCode <- NULL # to delete from the df
summary(dfi)
summary(dfi$Price)
summary(dfi[, c('Price', 'Cost')])

# disadvantage of sharing too little with your audience? 
# The audience may overgeneralize.

#  hide the code of a chunk in the knitted notebook?
  # echo = F

dim(dfi)
nrow(dfi)
dfi[1:5, c(1,3)]

# overall data analytics time goes into data assembling?
  # 80%

summarizeAndPlot <- function(dataframe = cars, column = 'speed') {
  print(summary(dataframe))
  print(paste0('the value in row 1 cell 1 is: ', dataframe[1,1]))
  return(print(paste0('the value r 2 cell 2 is ', dataframe[2,2])))
  hist(dataframe[, column])
}

a <- summarizeAndPlot(dfi, 'Tax')
date1Words <- 'April 3, 2005'
date1Short <- '04/03/05'
date1Numeric <- 040305

install.packages('lubridate')
library(lubridate)
??lubridate
d1w <- mdy(date1Words)
d1s <- mdy(date1Short)
d1n <- mdy(date1Numeric)
ymd('2005-04-03')
print(d1w)
