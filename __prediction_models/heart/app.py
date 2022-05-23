from flask import Flask, jsonify
from requests import request
from flask import request
import pickle
import numpy as np


model = pickle.load(open('model2.pkl','rb'))

app = Flask(__name__)

@app.route('/')
def best():
    return "Welcome to Cardic Arrest predictions"

@app.route('/heart',methods=["POST"])
def heart():
    age =request.form.get('age')
    sex=request.form.get('sex')
    cp=request.form.get('cp')
    trestbps=request.form.get('trestbps')
    chol=request.form.get('chol')
    fbs=request.form.get('fbs')
    restecg=request.form.get('restecg')
    thalach =request.form.get('thalach')
    exang =request.form.get('exang')
    oldpeak =request.form.get('oldpeak')
    slope =request.form.get('slope')
    ca =request.form.get('ca')
    thal =request.form.get('thal')

    input_query=np.array([[age,sex,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal]])

    result =model.predict(input_query)[0]


   # result ={'Pregnancies':Pregnancies,'Glucose':Glucose,'BloodPressure':BloodPressure,'SkinThickness':SkinThickness,'Insulin':Insulin,'BMI':BMI,'DiabetesPedigreeFunction':DiabetesPedigreeFunction,'Age':Age}

    return jsonify({'person is':str(result)})






if __name__=='__main__':
    app.run(debug=True)