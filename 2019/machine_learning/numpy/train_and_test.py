# split train and test
# It is often common to split a loaded dataset into a train and test set
from numpy import array
# define array
data = array([[11, 22, 33],
                [44, 55, 66],
		[77, 88, 99]])
# separate data
split = 2
train,test = data[:split,:],data[split:,:]
print(train)
print(test)
print(train.shape)
print(test.shape)
