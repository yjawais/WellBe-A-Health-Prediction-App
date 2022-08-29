import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../designs/background_2.dart';
import '../../widgets/auth/signup_form.dart';

class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';

  const SignupScreen({Key? key}) : super(key: key);
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
 // final _auth = FirebaseAuth.instance;

  var _isLoading = false;

  void _submitAuthForm(
    String username,
    String email,
    String password,
    BuildContext ctx,
  ) async {
  //  UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });

     // authResult = await _auth.createUserWithEmailAndPassword(
       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set({
        'username': username,
        'email': email,
      });

    
      
    } on PlatformException catch (error) {
      var message = 'An error occured.';
      if (error.message != null) {
       // message = error.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics:const ClampingScrollPhysics(),
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
             const BackgroundSecond(),
              SignupForm(_submitAuthForm, _isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
