import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './dialogbox.dart';

// HeartInput.dart: Defines a Stateful widget which takes numerical values of diabetes test and
// get diabetes risk result. Sends the numerical data given by user through HTTP POST request to REST API Endpoint.

class HeartInput extends StatefulWidget {
  const HeartInput({Key? key}) : super(key: key);

  @override
  _HeartInputState createState() => _HeartInputState();
}

class _HeartInputState extends State<HeartInput> {
  final _formKey = GlobalKey<FormState>();
  int? sex,
      cp,
      trestbps,
      chol,
      fbs,
      age,
      restecg,
      thalach,
      exang,
      slope,
      ca,
      thal;
  double? oldpeak;
  var url = Uri.parse('https://wellbeheart.onrender.com/heart');
 // var url = Uri.parse('https://wellbeheart.herokuapp.com/heart');

  int show = -1;
  @override
  void initState() {
    age = 35;
    sex = 0;
    cp = 1;
    trestbps = 150;
    chol = 200;
    fbs = 0;
    restecg = 0;
    thalach = 140;
    exang = 0;
    oldpeak = 1.0;
    slope = 1;
    ca = 0;
    thal = 2;
  }

  Future<void> getPredictions(
    int? age,
    int? sex,
    int? cp,
    int? trestbps,
    int? chol,
    int? fbs,
    int? restecg,
    int? thalach,
    int? exang,
    double? oldpeak,
    int? slope,
    int? ca,
    int? thal,
  ) async {
    // final isValid = _formKey.currentState!.validate();

    _formKey.currentState?.save();
    FocusScope.of(context).unfocus();

    Map<String, String> headers = {"Content-type": "text/html"};
    Map<String, String> body = {
      "age": "$age",
      "sex": "$sex",
      "cp": "$cp",
      "trestbps": "$trestbps",
      "chol": "$chol",
      "fbs": "$fbs",
      "restecg": "$restecg",
      "thalach": "$thalach",
      "exang": "$exang",
      "oldpeak": "$oldpeak",
      "slope": "$slope",
      "ca": "$ca",
      "thal": "$thal",
    };
    http.Response response = await http.post(
      url,
      //headers: headers,
      body: body,
    );

    // print('Response status: ${response.statusCode}'); //uncomment while testing
    // print('Response body: ${response.body.toString()}');

    //print(response.body.toString());
  //  print(json.decode(response.body)['person is']);

    setState(() {
      show = int.parse(json.decode(response.body)['person is']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding:const EdgeInsets.all(15),
            margin:const EdgeInsets.all(5),
            child: Column(
              children: [
               const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Enter Following Parameters",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Age",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Sex - Enter 1 for Male, 0 for Female",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        sex = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "cp",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        cp = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "trestbps",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        trestbps = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "chol",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        chol = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "fbs",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        fbs = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "restecg",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        restecg = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "thalach",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        thalach = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "exang ",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        exang = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "oldpeak ",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        oldpeak = double.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    //onTap: ()=>Tooltip(message: "Hello World", child: Text("foo")),
                    decoration: InputDecoration(
                      labelText: "slope ",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      
                      setState(() {
                        slope = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "ca ",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        ca = int.parse(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "thal ",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:const BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        thal = int.parse(value);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    age = age ?? 35;
                    sex = sex ?? 0;
                    cp = cp ?? 1;
                    trestbps = trestbps ?? 150;
                    chol = chol ?? 200;
                    fbs = fbs ?? 0;
                    restecg = restecg ?? 0;
                    thalach = thalach ?? 140;
                    exang = exang ?? 0;
                    oldpeak = oldpeak ?? 1.0;
                    slope = slope ?? 1;
                    ca = ca ?? 0;
                    thal = thal ?? 2;
                    getPredictions(
                      age,
                      sex,
                      cp,
                      trestbps,
                      chol,
                      fbs,
                      restecg,
                      thalach,
                      exang,
                      oldpeak,
                      slope,
                      ca,
                      thal,
                    ).then((_) => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DialogBox(show);
                        }));

                    // print(
                    //     "$sex, $cp, $trestbps, $chol, $fbs,  $age, $oldpeak");
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
                      constraints:
                        const  BoxConstraints(maxWidth: 150, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: const Text(
                        "Get Results",
                        textAlign: TextAlign.center,
                        style:TextStyle(
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
      //     sex = sex ?? 0;
      //     cp = cp ?? 121;
      //     trestbps = trestbps ?? 69;
      //     st = st ?? 20;
      //     fbs = fbs ?? 0;
      //     bmi = bmi ?? 32;
      //     oldpeak = oldpeak ?? 0.47;
      //     age = age ?? 35;
      //     getPredictions(sex, cp, trestbps, st, fbs, bmi, age, oldpeak);

      //     print("$sex, $cp, $trestbps, $st, $fbs, $bmi, $age, $oldpeak");
      //   },
      // ),
    );
  }
}
