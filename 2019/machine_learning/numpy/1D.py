# one dimensional example
from numpy import array
# list of data
data = [11, 22, 33, 44, 55]
# array of data
data = array(data)
print(data)
print(type(data))
# Simple index
# Print first element
print(data[0])
# Print 4th element
print(data[4])
# Print last element
print(data[-1])
# Print second last element
print(data[-2])
# Slicing
# All elements
print(data[:])
# Only elements from 0 up to and not including 1
print(data[0:1])
# Slice in reverse
print(data[-2:])
# Print in reverse order without knowing size of array
print(data[::-1])
