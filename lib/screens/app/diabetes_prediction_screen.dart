import 'package:flutter/material.dart';
import '../../designs/background.dart';

class DiabetesPredictionScreen extends StatefulWidget {
  static const routeName = '/diabetes';
  @override
  _DiabetesPredictionScreenState createState() =>
      _DiabetesPredictionScreenState();
}

class _DiabetesPredictionScreenState extends State<DiabetesPredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("diabetes prediction"),
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
        children: [
          Background(),
          Container(
            child: Text("diabetes"),
          ),
        ],
      ),
    );
  }
}
