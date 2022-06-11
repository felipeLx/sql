######### CHARACTER STRINGS ########
# Introduction----
# There are a variety of tasks that are often performed on columns of character
# strings. In this lesson we'll demonstrate how to use the stringr package to
# perform some tasks that may be used to clean up data.

# Install and load the stringr package----
# install.packages('stringr')
library(stringr) # Review the function names in the Packages and Help panes. The functions we use start with str_

# Simple example----
testString <- 'This is so fun.'

# Discussion: These functions are vectorized, so they will perform that same
# operation for every row in a vector of data.

# Read in data----
j17i <- read.csv('jan17Items.csv')

# Discussion: This data is already pretty clean, but we may want to do some
# additional wrangling depending on our analysis.

# Length----
str_length(testString)
# Maybe we think that there's some association between the length of a name for
# a menu item and the sales. We can quickly get a count of the number of 
# characters in a string
j17i$lineItemLength <- str_length(j17i$LineItem) # Create a new column in the j17i dataframe that contains the number of characters in the lineItem for that row.
hist(j17i$lineItemLength)

# Case----
str_to_title(testString)
str_to_lower(testString)
str_to_upper(testString)

unique(j17i$LineItem) # Notice that most everything is title case except for the general category

# We can easily convert everything to lower, upper, or title case. Here's an
# illustration of title.
j17i$lineItemLower <- str_to_title(j17i$LineItem)
unique(j17i$lineItemLower) # Now everything has the same title case. The "A" in "and" was also capitalized.

# Discussion: When analyzing text, all characters are often changed to 
# lower/upper case because string functions are typically case sensitive.

# Detect----
# A substring is a portion of a string. The str_detect function returns a 
# logical value (TRUE OR FALSE) to indicate whether or not that substring was 
# detected.
str_detect(testString, 'his')
j17i$kabob <- str_detect(j17i$LineItem, 'kabob') # It's case sensitive, so this won't work
j17i$kabob <- str_detect(j17i$lineItemLower, 'kabob') # This is safest
j17i$noKabob <- str_detect(j17i$lineItemLower, 'kabob', negate = T) # This is safest

# Discussion: This type of function can be used to create new categories, like the kabob category above.
kabobs <- j17i[j17i$kabob == T,] # Returns only the observations that have kabobs in the line item
unique(kabobs$LineItem)

# Replace----
# Useful for replacing a substring with a different substring
str_replace(testString, 'so', 'really really')
testString <- str_replace(testString, 'so', 'really really')
str_replace(testString, 'really', 'so')
str_replace_all(testString, 'really', 'so')
unique(j17i$LineItem) # Notice the multiple hyphens in Grow-Your-Own-Mushroom Kit
# Let's assume that you want to remove all of hyphens in a string, like in the
# Grow-Your-Own-Mushroom Kit
j17i$LineItem <- str_replace_all(j17i$LineItem, '-', ' ')
unique(j17i$LineItem) # Now all of the hyphens have been removed

# Split----
# Converts a single column of data into two or more columns
str_split(testString, ' ')
j17i$dateTime <- str_split(j17i$Time, pattern = 'T') # Notice that it returns a list within Time2
dateTime <- str_split(j17i$Time, pattern = 'T', simplify = T) # Now it breaks the two parts into two separate columns
j17i$date <- dateTime[,1] # Saves the date string as a new column, still in a string format.
j17i$time <- dateTime[,2] # Saves the time string as a new column, still in a string format.
