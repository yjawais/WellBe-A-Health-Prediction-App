import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/app/main_cards.dart';
import '../../designs/background.dart';
import '../../widgets/app/tips_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                padding: const EdgeInsets.all(10),
                child: DropdownButton(
                  underline: Container(),
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 35,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app,
                              color: Theme.of(context).errorColor),
                          const SizedBox(width: 8),
                          const Text('Logout'),
                        ],
                      ),
                      value: 'logout',
                    ),
                  ],
                  onChanged: (itemIdentifier) {
                    if (itemIdentifier == 'logout') {
                      FirebaseAuth.instance.signOut();
                    }
                  },
                ),
              ),
            ],
            title: Row(
              children: const [
                Image(
                  image: AssetImage("assets/images/WellBelogo.png"),
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "WellBe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
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
          body: SingleChildScrollView(
            child: Container(
              //height: 500,
              padding: const EdgeInsets.all(5),
              //margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const MainCard(
                    "assets/images/heart.png",
                    "Heart Disease Prediction",
                    "A model to predict the chances of a heart disease",
                    '/heart',
                  ),
                  const MainCard(
                    "assets/images/diabetes.png",
                    "Diabetes Prediction",
                    "A model to predict diabetes risk",
                    '/diabetes',
                  ),
                  const SizedBox(height: 75),
                  Container(
                    child: const TipsCard(),
                    alignment: Alignment.bottomCenter,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
