import 'package:flutter/material.dart';
import '../../designs/background.dart';
import '../../widgets/app/heartInput.dart';
class HeartPredictionScreen extends StatefulWidget {
  static const routeName = '/heart';
  @override
  _HeartPredictionScreenState createState() => _HeartPredictionScreenState();
}

class _HeartPredictionScreenState extends State<HeartPredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heart prediction"),
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
            child: HeartInput(),
          ),
        ],
      ),
    );
  }
}
