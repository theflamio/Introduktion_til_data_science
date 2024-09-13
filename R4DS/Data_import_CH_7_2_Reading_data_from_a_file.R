



# 7.2.4 Exercises reading data from a file --------------------------------


# 1:  What function would you use to read a file where fields were separated with “|”?
#   
# 2:  Apart from file, skip, and comment, what other arguments do read_csv() and read_tsv() have in common?
#   
# 3:  What are the most important arguments to read_fwf()?
#   
# 4:  Sometimes strings in a CSV file contain commas. 
#     To prevent them from causing problems, they need to be surrounded by a quoting character, 
#     like " or '. By default, read_csv() assumes that the quoting character will be ". 
#     To read the following text into a data frame, what argument to read_csv() do you need to specify?

#     "x,y\n1,'a,b'"

# 5:  Identify what is wrong with each of the following inline CSV files. What happens when you run the code?

#     read_csv("a,b\n1,2,3\n4,5,6")
#     read_csv("a,b,c\n1,2\n1,2,3,4")
#     read_csv("a,b\n\"1")
#     read_csv("a,b\n1,2\na,b")
#     read_csv("a;b\n1;3")