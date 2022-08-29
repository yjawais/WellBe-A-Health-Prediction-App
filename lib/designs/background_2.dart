import 'package:flutter/material.dart';

class BackgroundSecond extends StatelessWidget {
  const BackgroundSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.3,
                0.6,
                0.9,
              ],
              colors: [
                Color(0xffd2f6fc),
                Color(0xffd7f8e8),
                Color(0xfff0fff3),
                Color(0xff9df3c4),
              ],
            )),
          ),
          Column(
            children: [
              const SizedBox(height: 45),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'WellBe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF09051C),
                    fontSize: 35,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'A Health Prediction App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF09051C),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.topCenter,
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/WellBelogo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   // height: size.height,
          //   // width: size.width,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/WellBelogo.png'),
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
