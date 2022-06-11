######### MORE ON FUNCTIONS: ARGUMENTS, CREATING, PRINTING, SAVING RESULTS, RETURNING RESULTS ########
# Introduction----
# Whether your dealing with data types, reading in data, or other analytic tasks
# a fundamental principle of data analytic languages, and programming in
# general, is to avoid repeating code. This concept is often abbreviated as DRY: 
# Don't repeat yourself. One reason why you should not repeat code is because 
# it's a waste of time. Repeating code also leads to more lines of code to
# maintain.

# The opposite of DRY code is WET code in which you write out the process every 
# time.

# One way to avoid using WET code is to package a process or routine into a
# function. In this lesson I assume that you’ve already had some experience using 
# functions in R. So, I want to dive deeper into functions so that you can use 
# them more effectively. I think a great way to learn about functions is to 
# create some yourself.
# You may have already used some functions, but I want to share more details 
# about how to use and create them.

# Arguments to functions----
# Also known as parameters. With respect to a function, they are the variables.
# The process performed by the function will not change, but the output will
# change based on the arguments.

?log # In the help, there are two arguments: x, and base. The = exp(1) after the base means that there's a default value that will be used if you don't assign it a value.

log(x = 100, base = 10) # You can explicitly identify the values for each argument
log(100, 10) # But you don't have to if they come in the order that the arguments are taken
log(base = 10, x = 100) # You can put them out of order if you explictly identify them


?sum # In the help, there are two arguments: ..., and na.rm. The ellipsis ... means that the number of arguments can vary
sum(1,3,5)

# Creating functions----
# Let's create a function that uses the built-in cars dataset
?cars
summarizeAndPlot <- function(dataframe = cars, column = 'speed'){
  summary(dataframe)
  paste0('The value in row 1, column 1 is: ', dataframe[1,1])
  paste0('The value in row 2, column 2 is: ', dataframe[2,2])
  hist(dataframe[,column])
}

summarizeAndPlot() # Notice that it prints the histogram, but not the summary stats or other lines of text. It will only print text if it comes last.

# Printing----
# Give instructions to print the summary statistics
summarizeAndPlot <- function(dataframe = cars, column = 'speed'){
  print(summary(dataframe))
  print(paste0('The value in row 1, column 1 is: ', dataframe[1,1]))
  print(paste0('The value in row 2, column 2 is: ', dataframe[2,2]))
  hist(dataframe[,column])
}
summarizeAndPlot() # This now prints the summary statistics and the other two lines of text.

# Let's test it out on another dataset
j17i <- read.csv('jan17Items.csv', sep = ',') # Read in the jan17Items.csv dataset
summarizeAndPlot(j17i, 'Tax') # It works well!

# Saving results----
# Modify the function to return the summary statistics.
# You can save whatever is returned from a function into an object
a <- summarizeAndPlot(j17i, 'Tax') # This runs the function and saves the returned values to the variable, a
a # This returns the contents of the variable a to the console. Notice that it creates a list that has elements needed for the histogram, but not the summary statistics.

# Returning----
# Adjust the function so that it returns the summary statistics
summarizeAndPlot <- function(dataframe = cars, column = 'speed'){
  print(summary(dataframe))
  return(summary(dataframe)) # This is the line of code that returns the summary statistics
  hist(dataframe[,column])
}
a <- summarizeAndPlot(j17i, 'Tax') # Now run the function and save the returned output to variable a again.
a # You can see that the summary statistics are now the contents of a

# You can return more than one thing by creating a list, but that's beyond the scope of this lesson.
# The point is that printing and returning serve different purposes.

# Conclusion----
# Whether you create your own or use functions created by someone else, these 
# key concepts should help you understand how to use them effectively. 