import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../../designs/background_2.dart';
import '../../widgets/auth/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

 const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;

  var _isLoading = false;

 Future<void> _submitAuthForm(
    String email,
    String password,
    BuildContext ctx,
  ) async {
    //UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
       
    } catch (error) {
      var message = 'An error occured.';
      if (error != null) {
         message = error as String;
      }

      ScaffoldMessenger.of(ctx).showSnackBar(
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
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
            const  BackgroundSecond(),
            
              LoginForm(_submitAuthForm, _isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
