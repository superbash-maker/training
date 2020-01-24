# This is like the Hello, World of machine learning
import tensorflow as tf
from tensorflow import keras
import matplotlib.pyplot as plt
import numpy as np

fashion_mnist = keras.datasets.fashion_mnist
# Download the dataset into four numpy arrays
(train_images, train_labels), (test_images, test_labels) = fashion_mnist.load_data()

# Each image is mapped to a single label. 
# Since the class names are not included with the dataset 
# store them here to use later when plotting the images
class_names = ['T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat', 'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankel boot']

# Check the format of dataset before training
# 60000 images 28x28 pixels
print("Shape of training images ",train_images.shape)

# 60000 labels
print("Length of training labels ",len(train_labels))

# Check the size of the test set
print("Shape of test images ",test_images.shape)

# Check labels for test set
print("Length of training labels ",len(test_labels))

# Preprocess data pixel values fall in the range of 0 to 255
plt.figure()
plt.imshow(train_images[0])
plt.colorbar()
plt.grid(False)
#plt.show()
plt.savefig('image1_post.png')
# Scale these values to a range of 0 to 1 before feeding to the neural network model
train_images = train_images / 255.0
# What is done to the training set must be done to the test set
test_images = test_images / 255.0
# Display the first 25 images of the training set and the class name of each
plt.figure(figsize=(10,10))
for i in range(25):
    # The subplot means 5 plots per row and 5 plots per column
    plt.subplot(5,5,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(train_images[i], cmap=plt.cm.binary)
    plt.xlabel(class_names[train_labels[i]])
#plt.show()
plt.savefig('25images_post.png')

# Build the model
# Building the NN requires configuring the layers of the model then compiling 
# Setup the layers
# The basic building block of a neural network is the layer
# Layers will extract representations from the data which is fed in 
# We will chain together simple layers as this is what most deep learning consists of

# The first layer transforms images from 2d-array (28 by 28 pixels) to 1d-array 28*28 = 784 pixels, so just reformating of data and no learning takes place here
# The second and third layers are densely connected or fully connected neutral layers. 
# The first Dense layer has 128 nodes (or neurons)
# The second is a 10 node layer, which returns an array of 10 probability scores that sum to 1
# Each node contains a score that indicates the probability that the current image belongs to one of the 10 classes

model = keras.Sequential([keras.layers.Flatten(input_shape=(28, 28)), keras.layers.Dense(128, activation=tf.nn.relu), keras.layers.Dense(10, activation=tf.nn.softmax)])

# Compile the model
# There are a few settings that need to be added before a model can be trained
# Loss function - Measures how accurate the model is during training. This function should be minimized to "steer" the model in the right direction
# Optimizer - This is how the model is updated based on the data it sees and its loss function
# Metrics - Used to monitor the training and testing steps. Here we use accuracy which is the fraction of images that are correctly classified

model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# Train the model
# Feed in the training data

model.fit(train_images, train_labels, epochs=5)

# Compare how model performs on test dataset

test_loss, test_acc = model.evaluate(test_images, test_labels)

print('Test accuracy:', test_acc)

# Make predictions about some images
# These will be predictions for images in the test set

predictions = model.predict(test_images)

# Lets have a look at the prediction
# This gives an array of 10 numbers which correspond to the confidence of the model that the image lies in one of the 10 labels 
print('Predicted: ', predictions[0])

# Lets find the highest confidence value

print('Label for highest confidence: ',np.argmax(predictions[0]))

# Now lets see that the test label corresponds to what we found

print('Test label: ',test_labels[0])

# We can graph this to look at the full set of 10 channels

def plot_image(i, predictions_array, true_label, img):
    predictions_array, true_label, img = predictions_array[i], true_label[i], img[i]
    plt.grid(False)
    plt.xticks([])
    plt.yticks([])

    plt.imshow(img, cmap=plt.cm.binary)

    predicted_label = np.argmax(predictions_array)
    if predicted_label == true_label:
        color = 'blue'
    else:
        color = 'red'

    plt.xlabel("{} {:2.0f}% ({})".format(class_names[predicted_label],
                                100*np.max(predictions_array),
                                class_names[true_label]),
                                color=color)

def plot_value_array(i, predictions_array, true_label):
    predictions_array, true_label = predictions_array[i], true_label[i]
    plt.grid(False)
    plt.xticks([])
    plt.yticks([])
    thisplot = plt.bar(range(10), predictions_array, color="#777777")
    plt.ylim([0, 1]) 
    predicted_label = np.argmax(predictions_array)

    thisplot[predicted_label].set_color('red')
    thisplot[true_label].set_color('blue')

# Let's look at the 0th image, predictions, and prediction array
i = 0
plt.figure(figsize=(8,6))
plt.subplot(1,2,1)
plot_image(i, predictions, test_labels, test_images)
plt.subplot(1,2,2)
plot_value_array(i, predictions,  test_labels)
plt.savefig('0th_image.png')
#plt.show()

# Let's plot the 12th image, predictions and prediction array
i = 12
plt.figure(figsize=(8,6))
plt.subplot(1,2,1)
plot_image(i, predictions, test_labels, test_images)
plt.subplot(1,2,2)
plot_value_array(i, predictions,  test_labels)
plt.savefig('12th_image.png')
#plt.show()

# Let's plot the first 3 test images, their predicted label and the true label
# Color correct predictions in blue, incorrect predictions in red
plt.figure(figsize=(12,10))
for i in range(3):
    plt.subplot(3, 2, 2*i+1)
    plot_image(i, predictions, test_labels, test_images)
    plt.subplot(3, 2, 2*i+2)
    plot_value_array(i, predictions, test_labels)
#plt.show()
plt.savefig('predictions.png')

# Then plot the first 15 test images, their predicted label and the true label
#plt.figure(figsize=(12,10))
#for i in range(15):
#    plt.subplot(5, 6, 2*i+1)
#    plot_image(i, predictions, test_labels, test_images)
#    plt.subplot(5, 6, 2*i+2)
#    plot_value_array(i, predictions, test_labels)
#plt.show()
#plt.savefig('predictions.png')

