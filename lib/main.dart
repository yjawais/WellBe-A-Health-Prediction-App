import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/app/home_screen.dart';
import './screens/app/splash_screen.dart';
import './screens/auth/login_screen.dart';
import './screens/auth/signup_screen.dart';
import './screens/app/diabetes_prediction_screen.dart';
import './screens/app/heart_prediction_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF54c0bc),
        accentColor: const Color(0xFF1fc585),
        fontFamily: 'BentonSans',
        scaffoldBackgroundColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            
            if (userSnapshot.hasData) {
              return HomeScreen();
            }
            return SplashScreen();
            
          }),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        HeartPredictionScreen.routeName: (ctx) =>HeartPredictionScreen(),
        DiabetesPredictionScreen.routeName: (ctx) => DiabetesPredictionScreen(),
      },
    );
  }
}
