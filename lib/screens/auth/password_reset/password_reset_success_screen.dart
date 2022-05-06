import 'package:flutter/material.dart';
import '../../../screens/auth/login_screen.dart';
import '../../../designs/gradient_button.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //alignment: Alignment.center,
              height: 781,
              //  width: 700,
              decoration: const  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Pattern_congrats.png'),
                  // alignment: Alignment.topCenter
                ),
              ),

              child: Center(
                child: Column(
                  children: [
                    Container(
                      margin: const  EdgeInsets.only(top: 50, left: 20),
                      padding:  const EdgeInsets.only(top: 200),
                      child: const  Image(
                        image:
                            AssetImage('assets/images/SuccessIllustration.png'),
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      margin: const  EdgeInsets.only(top: 10, left: 20, bottom: 20),
                      padding: const  EdgeInsets.only(top: 20),
                      child: const  Image(
                        image: AssetImage('assets/images/Text.png'),
                        alignment: Alignment.center,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const  EdgeInsets.only(top: 80),
                        // child: GestureDetector(
                        //     onTap: () {},
                        //     child: Image(
                        //       image: AssetImage('lib/images/Try_Order.png'),
                        //     )),
                        child: GradientButton(
                          buttonWidth: 150,
                          text: "Back",
                          function: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
