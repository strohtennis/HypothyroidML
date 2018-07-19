# Turi is a platform for Machine Learning
# turicreate is Apple's version of Turi
# https://apple.github.io/turicreate/docs/api/index.html#

import turicreate as turi

#import the data
url = "hypothyroiddataset/hypothyroid.data.csv"

#save into sframe
data = turi.SFrame(url)

#pretty prints data
data.explore()
#shows graph of data
data.show()

#split the data into 80% training, 20% evaluation
trainingBuffers, testingBuffers = data.random_split(0.80)

#create the model using 'classification'
#model = turi.classifier.create(trainingBuffers,
 #                              target='diagnosis')
model = turi.random_forest_classifier.create(trainingBuffers, target = 'diagnosis')


#evaluate the model
evaluations = model.evaluate(testingBuffers)
print evaluations["accuracy"]

#save & export
model.save("hypothyroid.model")
model.export_coreml("HypoThyroidClassifier.mlmodel")
