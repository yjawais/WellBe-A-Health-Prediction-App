import pandas as pd
import numpy as np
import joblib
from PIL import Image
import streamlit as st
import warnings
warnings.filterwarnings("ignore")


# loading in the model to predict on the data
pickle_in = open('diabetes_model.pkl', 'rb')
classifier = joblib.load(pickle_in)


# defining the function which will make the prediction using
# the data which the user inputs
def prediction(Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age):

	prediction = classifier.predict(
		[[Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age]])
	#print(prediction)
	return prediction




# this is the main function in which we define our webpage
def main():
  html_temp = """
    <div style ="background-color:yellow;padding:13px">
    <h1 style ="color:black;text-align:center;">Diabetes Classifier ML App </h1>
    </div>
    """



  Pregnancies = st.text_input("Pregnancies","0")
  Glucose = st.text_input("Glucose","121")
  BloodPressure = st.text_input("Blood Pressure","69")
  SkinThickness = st.text_input("Skin Thickness","20")
  Insulin = st.text_input("Insulin","0")
  BMI = st.text_input("BMI","32")
  DiabetesPedigreeFunction = st.text_input("Diabetes Pedigree Function","0.47")
  Age = st.text_input("Age","35")

  result =""


  if st.button("Predict"):
        result = prediction(Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age)
  st.success('The output is {}'.format(result))

if __name__=='__main__':
	main()
