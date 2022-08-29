import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../designs/gradient_button.dart';
import '../auth/login_screen.dart';
import '../auth/signup_screen.dart';
import '../../designs/background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          SizedBox(
            height: size.height,
            child: Center(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    const SizedBox(height: 80),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF09051C),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 35),
                    Container(
                      height: 250,
                      width: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/WellBelogo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GradientButton(
                      text: "Login",
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      buttonWidth: 250,
                    ),
                    const SizedBox(height: 20),
                    FlatButton(
                      color: Colors.white,
                      textColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 250, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
