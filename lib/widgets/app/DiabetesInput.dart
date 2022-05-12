import 'dart:convert';
import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// diabetesInput.dart: Defines a Stateful widget which takes numerical values of diabetes test and
// get diabetes risk result. Sends the numerical data given by user through HTTP POST request to REST API Endpoint.

class DiabetesInput extends StatefulWidget {
  @override
  _DiabetesInputState createState() => _DiabetesInputState();
}

class _DiabetesInputState extends State<DiabetesInput> {
  final _formKey = GlobalKey<FormState>();
  int? preg, glucose, bp, st, insulin, age;
  double? dpf, bmi;
  var url = Uri.parse('https://wellbedia.herokuapp.com/pre');
  // Uri(
  //   scheme: 'https',
  //   host: 'mldiabete.herokuapp.com',
  //   path: '/predict',
  //   );
  //"http://192.168.1.3:5000/predict"; // This is local ip of the network on which flask server is running
  int show = -1;
  @override
  void initState() {
    preg = 0;
    glucose = 121;
    bp = 69;
    st = 20;
    insulin = 0;
    bmi = 32.0;
    age = 35;
    dpf = 0.47;
  }

  Future<void> getPredictions(int? preg, int? glucose, int? bp, int? st,
      int? insulin, double? bmi, int? age, double? dpf) async {
    // final isValid = _formKey.currentState!.validate();

    _formKey.currentState?.save();
    FocusScope.of(context).unfocus();
    
    Map<String, String> headers = {"Content-type": "text/html"};
    Map<String, String> body = {
        //once without encode once float error
        //"disease": "diabetes",
        // "preg": "$preg",
        // "glucose": "$glucose",
        // "blood pressure": "$bp",
        // "skin thickness": "$st",
        // "insulin": "$insulin",
        // "BMI": "$bmi",
        // "diabetes pedegree function": "$dpf",
        // "age": "$age",
        //form
        "Pregnancies": "$preg",
        "Glucose": "$glucose",
        "BloodPressure": "$bp",
        "SkinThickness": "$st",
        "Insulin": "$insulin",
        "BMI": "$bmi",
        "DiabetesPedigreeFunction": "$dpf",
        "Age": "$age",
      };
    http.Response response = await http.post(
      url,
      //headers: headers,
      body: body,
    );
    print('sent api');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body.toString()}');
  

   //print(response.body.toString());
 print(json.decode(response.body)['person is diabatic']);

    setState(() {
       show = int.parse(json.decode(response.body)['person is diabatic']);
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Enter following parameters",
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "preg",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        preg = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Glucose",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        glucose = int.parse(value) ;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Blood Pressure",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        bp = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Skin Thickness",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        st = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Insulin",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        insulin = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "BMI",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        bmi = double.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "DiabetesPedegree Function",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        dpf = double.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Age",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        age = int.parse(value);
                      });
                    },
                  ),
                ),
                show == 1
                    ? Card(
                        child: ListTile(
                          subtitle: Text("High Risk",
                              style: TextStyle(
                                  fontSize: 22.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red)),
                          title: Text("Your Diabetes Risk",
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      )
                    : show == 0
                        ? Card(
                            child: ListTile(
                              subtitle: Text("Low Risk",
                                  style: TextStyle(
                                      fontSize: 22.5,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green)),
                              title: Text("Your Diabetes Risk",
                                  style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          )
                        : Card(
                            child: ListTile(
                              subtitle: Text("Not Tested",
                                  style: TextStyle(
                                      fontSize: 22.5,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                              title: Text("Your Diabetes Risk",
                                  style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Get Results"),
        onPressed: () {
          preg = preg ?? 0;
          glucose = glucose ?? 121;
          bp = bp ?? 69;
          st = st ?? 20;
          insulin = insulin ?? 0;
          bmi = bmi ?? 32;
          dpf = dpf ?? 0.47;
          age = age ?? 35;
          getPredictions(preg, glucose, bp, st, insulin, bmi, age, dpf);

          print("$preg, $glucose, $bp, $st, $insulin, $bmi, $age, $dpf");
        },
      ),
    );
  }
}
