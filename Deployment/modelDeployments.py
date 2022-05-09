import base64
import numpy as np
import io
import os.path
from PIL import Image
import keras
import sklearn
import joblib
from keras import backend as K
from keras.models import Sequential
from keras.models import load_model
from keras.preprocessing.image import ImageDataGenerator
from keras.preprocessing.image import img_to_array
from flask import request
from flask import jsonify
from flask import Flask
from flask_cors import CORS

app = Flask(__name__ , static_url_path="/static")
CORS(app)

def getModels():
    global covidModel , brainTumourModel , pneumoniaModel , diabetesModel
    covidModel = load_model('models/covid19.h5')
    brainTumourModel = load_model('models/braintumuor.h5')
    pneumoniaModel = load_model('models/pneumonia.h5')
    diabetesModel = joblib.load('models/diabetes_model.pkl')
    print('* models loaded')

def preprocessImage(image , targetSize):
    if image.mode != "RGB":
        image = image.convert("RGB")
    image = image.resize(targetSize)
    image = img_to_array(image)
    image = np.expand_dims(image , axis=0)
    return image

print("* Loading Keras Model")
getModels()

@app.route("/predict" , methods=["POST"])
def predict():
    diseaseType = request.form['disease']
    print(diseaseType)
    if (diseaseType == "pneumonia"):
        message = request.files['image']
        image = Image.open(message)
        processedImage = preprocessImage(image , targetSize=(299, 299))
        prediction = pneumoniaModel.predict(processedImage)
        print(prediction)
        probability = int(prediction[0,1]*100)
        print(probability)
        response = {
            'prediction': probability
        }
        return jsonify(response)
    elif (diseaseType == "covid"):
        message = request.files['image']
        image = Image.open(message)
        processedImage = preprocessImage(image , targetSize=(224, 224))
        prediction = covidModel.predict(processedImage)
        print(prediction)
        probability = int(prediction[0,0]*100)
        print(probability)
        response = {
            'prediction': probability
        }
        return jsonify(response)
    elif (diseaseType == "brainTumour"):
        message = request.files['image']
        image = Image.open(message)
        processedImage = preprocessImage(image , targetSize=(224, 224))
        prediction = brainTumourModel.predict(processedImage)
        print(prediction)
        probability = int(prediction[0,1]*100)
        print(probability)
        response = {
            'prediction': probability
        }
        return jsonify(response)
    elif (diseaseType == "diabetes"):
        input_tensor = [[request.form['pregnancies'] , request.form['glucose'] , request.form['blood pressure'] , request.form['skin thickness'] , request.form['insulin'] , request.form['BMI'] ,request.form['diabetes pedegree function'] , request.form['age']]]
        prediction = diabetesModel.predict(input_tensor)
        print(prediction)
        probability = int(prediction[0])
        response = {
            'prediction': probability
        }
        return jsonify(response)
    
@app.route("/" , methods=["GET"])
def home():
    return app.send_static_file("predict.html")
    


