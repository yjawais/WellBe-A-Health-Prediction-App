import 'package:flutter/material.dart';
import '../../model/tips.dart';
import 'dart:math';

class TipsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
// int result=1;
//      int randomNumber() {
//     var random =  Random();

//     int min = 1;

//     int max = 9;

//     int result = min + random.nextInt(max - min);
//  print(result);
//     return result;
//   }
    int max = 9;

    int randomNumber = Random().nextInt(max) + 1;
    //  final tipId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedTip =
        Dummy_Tips.firstWhere((element) => element.id == randomNumber);
    return Container(
      height: 135.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(left: 44.0),
              child: Column(
                children: [
                  Text(
                    "Tip Of The Day",
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${selectedTip.tip}',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            height: 124.0,
            width: 260,
            margin: const EdgeInsets.only(left: 46.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xffff8886),
                  Color(0xffffcccb),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
          ),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: const BoxDecoration(
              // image: DecorationImage(image: AssetImage("assets/images/Rectangle 22.png"),),

              shape: BoxShape.circle,
              color: Color(0xffffb99a),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2.0),
                alignment: FractionalOffset.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "assets/images/TheLifesaversStanding.png",
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
              ),
            
          ),
        ],
      ),
    );
  }
}
