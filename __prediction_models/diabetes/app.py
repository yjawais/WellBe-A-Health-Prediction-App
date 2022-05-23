#from crypt import methods
from flask import Flask, jsonify
from requests import request
from flask import request
import pickle
import numpy as np


model = pickle.load(open('model1.pkl','rb'))

app = Flask(__name__)

@app.route('/')
def home():
    return "Welcome to Diabetic predictions"

@app.route('/pre',methods=["POST"])
def pre():
    Pregnancies=request.form.get('Pregnancies')
    Glucose=request.form.get('Glucose')
    BloodPressure=request.form.get('BloodPressure')
    SkinThickness=request.form.get('SkinThickness')
    Insulin=request.form.get('Insulin')
    BMI=request.form.get('BMI')
    DiabetesPedigreeFunction=request.form.get('DiabetesPedigreeFunction')
    Age=request.form.get('Age')

    input_query=np.array([[Pregnancies,Glucose,BloodPressure,SkinThickness,Insulin,BMI,DiabetesPedigreeFunction,Age]])

    result =model.predict(input_query)[0]


   # result ={'Pregnancies':Pregnancies,'Glucose':Glucose,'BloodPressure':BloodPressure,'SkinThickness':SkinThickness,'Insulin':Insulin,'BMI':BMI,'DiabetesPedigreeFunction':DiabetesPedigreeFunction,'Age':Age}

    return jsonify({'person is diabatic':str(result)})






if __name__=='__main__':
    app.run(debug=True)