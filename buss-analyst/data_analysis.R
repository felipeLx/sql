# FACT: frame the question, assemble the data, calculate the results, tell others
# Decisions: 
  # what happen / why did happen / what is happening now / what will happen / what intervention
df <- read.csv('/home/felipelx/Desktop/workspace/sql/buss-analyst/jan17Items.csv')
df
str(df)
summarize(df)
?df
df[1:15]

v1 <- c(1156,7934,6334)
v2 <- c(52,988,NA)
mean(c(v1, v2), na.rm=T)

x <- c('fox', 'hound', 'hound')
xf <- factor(x)
summary(xf)

install.packages('stringr')
library(stringr)
testString <- 'This is stringr functions'
str_length(testString)
str_to_title(testString)
str_to_lower(testString)
str_to_upper(testString)

x <- c('Product 1', 'Product 1', 'Product 2', 'Product 2', 'Product 3')
plot(x)
y <- sum(c(FALSE, FALSE, TRUE, TRUE, TRUE, FALSE))
y

z <- is.na(30)
z

v3 <- c(2,1,3)
v4 <- c(1,2,3,4)
v3 < v4
