# Import all the libraries
import pandas
from pandas.plotting import scatter_matrix
import matplotlib.pyplot as plt
from sklearn import model_selection
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC

# Load the dataset
# One can also download the file to the local directory and just read it from there
url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/iris.csv"
names = ['sepal-length', 'sepal-width', 'petal-length', 'petal-width', 'class']
dataset = pandas.read_csv(url, names=names)

# Now lets look at the dataset
# How big is the dataset
print(dataset.shape)
# Look at first few rows of data
print(dataset[:21])
# Print me out elements 1 to 25
# print(dataset[1:26])

# Statistical summary
# Units are all in centimeters
print(dataset.describe())

# Look at the number of instances that belong to each class
print(dataset.groupby('class').size())

# Now we have a basic idea about the data lets visualize it
# First we do a univariate plot to better understand each attribute
dataset.plot(kind='box', subplots='True', layout=(2,2), sharex=False, sharey=False)
plt.savefig('univariate1.png')
#plt.show()

# Lets also create a histrogram
# Two of the input variables have somewhat of a Gaussian distribution
# This is useful as it will allow us to make use of appropriate algorithms to exploit this
dataset.hist()
plt.savefig('univariate2.png')
#plt.show()

# Multivariate plot
# This will allow us to check the relationship between variables if any
# Note the diagonal grouping of some pairs of attributes. This suggests a high correlation and a predictable relationship.
scatter_matrix(dataset)
plt.savefig('multivariate.png')
#plt.show()

# Creat a validation dataset
# In this case we will hold back some of the data and use this to see how accurate the best model is
# Split the dataset into 80% training and 20% testing/validation
array = dataset.values
# See what array looks like
#print(array)
X = array[:,:4]
Y = array[:, 4]
# Check what is stored in X and Y
print(X)
print(Y)

validation_size = 0.20
seed = 7
# You now have training data in the X_train and Y_train for preparing models and a X_validation and Y_validation sets that we can use later
X_train, X_validation, Y_train, Y_validation = model_selection.train_test_split(X, Y, test_size=validation_size, random_state=seed)

# Test Harness
# We will use 10-fold cross validation to estimate accuracy.
# This will split our dataset into 10 parts, train on 9 and test on 1 and repeat for all combinations of train-test splits.

seed = 7
scoring = 'accuracy'

# Build Models
# Let’s evaluate 6 different algorithms:

# Logistic Regression (LR)
# Linear Discriminant Analysis (LDA)
# K-Nearest Neighbors (KNN).
# Classification and Regression Trees (CART).
# Gaussian Naive Bayes (NB).
# Support Vector Machines (SVM).

# Two linear (LR and LDA) and four non linear (KNN, CART, NB, SVM) algorithms
# Random seed is reset before each run to ensure that the evaluation of each algorithm is performed using exactly the same data splits to ensure results are comparible

# Spot Check Algorithms
models = []
models.append(('LR', LogisticRegression(solver='liblinear', multi_class='ovr')))
models.append(('LDA', LinearDiscriminantAnalysis()))
models.append(('KNN', KNeighborsClassifier()))
models.append(('CART', DecisionTreeClassifier()))
models.append(('NB', GaussianNB()))
models.append(('SVM', SVC(gamma='auto')))
# evaluate each model in turn
results = []
names2 = []
for name, model in models:
	kfold = model_selection.KFold(n_splits=10, random_state=seed)
	cv_results = model_selection.cross_val_score(model, X_train, Y_train, cv=kfold, scoring=scoring)
	results.append(cv_results)
	names2.append(name)
	msg = "%s: %f (%f)" % (name, cv_results.mean(), cv_results.std())
	print(msg)

# Compare Algorithms
fig = plt.figure()
fig.suptitle('Algorithm Comparison')
ax = fig.add_subplot(111)
plt.boxplot(results)
ax.set_xticklabels(names2)
plt.savefig('comparison.png')
# plt.show()

# Make predictions on validation dataset
# We can see that the accuracy is 0.9 or 90%. 
# The confusion matrix provides an indication of the three errors made. 
# Finally, the classification report provides a breakdown of each class by precision, recall, f1-score and support 
# showing excellent results (granted the validation dataset was small).
knn = KNeighborsClassifier()
knn.fit(X_train, Y_train)
predictions = knn.predict(X_validation)
print(accuracy_score(Y_validation, predictions))
print(confusion_matrix(Y_validation, predictions))
print(classification_report(Y_validation, predictions))

# Do similar prediction using SVM
model = SVC(gamma='auto')
model.fit(X_train, Y_train)
predictions = model.predict(X_validation)
print(accuracy_score(Y_validation, predictions))
print(confusion_matrix(Y_validation, predictions))
print(classification_report(Y_validation, predictions))

