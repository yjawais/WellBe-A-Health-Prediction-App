// ignore_for_file: must_call_super

import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './dialogbox.dart';

// diabetesInput.dart: Defines a Stateful widget which takes numerical values of diabetes test and
// get diabetes risk result. Sends the numerical data given by user through HTTP POST request to REST API Endpoint.

class DiabetesInput extends StatefulWidget {
  const DiabetesInput({Key? key}) : super(key: key);

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
    st = 2;
    insulin = 0;
    bmi = 22.0;
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

    // print('Response status: ${response.statusCode}');//uncomment while testing
    // print('Response body: ${response.body.toString()}');

    //print(response.body.toString());
    //print(json.decode(response.body)['person is diabatic']);

    setState(() {
      show = int.parse(json.decode(response.body)['person is diabatic']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Enter Following Parameters",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Number of Pregnancies",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                      labelText: "Glucose (mg/dL) eg. 80",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        glucose = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Blood Pressure (mmHg) eg. 80",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                      labelText: "Skin Thickness (mm)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                      labelText: "Insulin (IU/mL) range(30-230 IU/mL)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                      labelText: "BMI (kg/m²) eg. 23.1",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                      labelText:
                          "DPF (depends on family history, range 0.1- 0.99)",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(),
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
                const SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    preg = preg ?? 0;
                    glucose = glucose ?? 121;
                    bp = bp ?? 69;
                    st = st ?? 2;
                    insulin = insulin ?? 0;
                    bmi = bmi ?? 22;
                    dpf = dpf ?? 0.47;
                    age = age ?? 35;
                    getPredictions(
                            preg, glucose, bp, st, insulin, bmi, age, dpf)
                        .then((_) => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DialogBox(show);
                            }));

                    // print(
                    //     "$preg, $glucose, $bp, $st, $insulin, $bmi, $age, $dpf");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff54C0BC),
                            Color(0xff1fc585),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 150, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Get Results",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // show == 1
                //     ? Card(
                //         child: ListTile(
                //           subtitle: Text("High Risk",
                //               style: TextStyle(
                //                   fontSize: 22.5,
                //                   fontWeight: FontWeight.w500,
                //                   color: Colors.red)),
                //           title: Text("Your Diabetes Risk",
                //               style: TextStyle(
                //                 fontSize: 17.5,
                //                 fontWeight: FontWeight.w500,
                //               )),
                //         ),
                //       )
                //     : show == 0
                //         ? Card(
                //             child: ListTile(
                //               subtitle: Text("Low Risk",
                //                   style: TextStyle(
                //                       fontSize: 22.5,
                //                       fontWeight: FontWeight.w500,
                //                       color: Colors.green)),
                //               title: Text("Your Diabetes Risk",
                //                   style: TextStyle(
                //                     fontSize: 17.5,
                //                     fontWeight: FontWeight.w500,
                //                   )),
                //             ),
                //           )
                //         : Card(
                //             child: ListTile(
                //               subtitle: Text("Not Tested",
                //                   style: TextStyle(
                //                       fontSize: 22.5,
                //                       fontWeight: FontWeight.w500,
                //                       color: Colors.grey)),
                //               title: Text("Your Diabetes Risk",
                //                   style: TextStyle(
                //                     fontSize: 17.5,
                //                     fontWeight: FontWeight.w500,
                //                   )),
                //             ),
                //           ),
                // SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text("Get Results"),
      //   onPressed: () {
      //     preg = preg ?? 0;
      //     glucose = glucose ?? 121;
      //     bp = bp ?? 69;
      //     st = st ?? 20;
      //     insulin = insulin ?? 0;
      //     bmi = bmi ?? 32;
      //     dpf = dpf ?? 0.47;
      //     age = age ?? 35;
      //     getPredictions(preg, glucose, bp, st, insulin, bmi, age, dpf);

      //     print("$preg, $glucose, $bp, $st, $insulin, $bmi, $age, $dpf");
      //   },
      // ),
    );
  }
}
