# two dimensional example
from numpy import array
# list of data
data = [[11, 22],
	[33, 44],
	[55, 66]]
# array of data
data = array(data)
print(data)
print(type(data))
# Comma used to seperate index
# This will give first row first column
print(data[0,0])
# To print all columns in first row
print(data[0,])
# Print only the first column
print(data[:,:-1])
# Print only the last column 
print(data[:, -1])
