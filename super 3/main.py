# Import necessary libraries
import tensorflow as tf
from keras import layers, models, datasets
from keras.applications import MobileNetV2
from keras.optimizers import Adam

# Load and preprocess the CIFAR-10 dataset
(train_images, train_labels), (test_images, test_labels) = datasets.cifar10.load_data()
train_images, test_images = train_images / 255.0, test_images / 255.0

# Create a base model with MobileNetV2 (pre-trained on ImageNet)
base_model = MobileNetV2(input_shape=(32, 32, 3), include_top=False, weights='imagenet')

# Freeze the layers of the pre-trained model
base_model.trainable = False

# Create a new model on top of the pre-trained base model
model = models.Sequential([
    base_model,
    layers.GlobalAveragePooling2D(),
    layers.Dense(10, activation='softmax')
])

# Compile the model
model.compile(optimizer=Adam(),
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display the model summary
model.summary()

# Train the model
model.fit(train_images, train_labels, epochs=5, validation_data=(test_images, test_labels))

# Evaluate the model on the test set
test_loss, test_acc = model.evaluate(test_images, test_labels)
print(f'Test accuracy: {test_acc}')