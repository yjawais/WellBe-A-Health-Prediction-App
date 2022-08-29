import 'package:flutter/material.dart';
import '../../designs/background.dart';
import '../../widgets/app/diabetesInput.dart';

class DiabetesPredictionScreen extends StatefulWidget {
  static const routeName = '/diabetes';

  const DiabetesPredictionScreen({Key? key}) : super(key: key);
  @override
  _DiabetesPredictionScreenState createState() =>
      _DiabetesPredictionScreenState();
}

class _DiabetesPredictionScreenState extends State<DiabetesPredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diabetes Prediction"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xff1fab89),
                  Color(0xff9df3c4),
                ]),
          ),
        ),
      ),
      body: Stack(
        children: const [
          Background(),
          DiabetesInput(),
        ],
      ),
    );
  }
}
