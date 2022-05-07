import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../screens/auth/signup_screen.dart';

import '../../screens/auth/password_reset/forgot_password_screen.dart';
import '../../designs/gradient_button.dart';

class LoginForm extends StatefulWidget {
  final void Function(
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;

  bool isLoading;

  LoginForm(
    this.submitFn,
    this.isLoading,
  );
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  var _userEmail = '';

  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 1.35),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Login To Your Account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF09051C),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(
                        //   color: Color(0xfff4f4f4),
                        //   width: 1,
                        // ),
                      ),
                      margin: const EdgeInsets.all(5),
                      child: TextFormField(
                        key: const ValueKey('email'),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: InputBorder.none,
                           prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/Message.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          _userEmail = value as String;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(
                        //   color: Color(0xfff4f4f4),
                        //   width: 1,
                        // ),
                      ),
                      child: TextFormField(
                        key: const ValueKey('password'),
                        validator: (value) {
                          if (value != null && value.isEmpty ||
                              value!.length < 7) {
                            return 'Enter password of atleast 7 character';
                          }
                          return null;
                        },
                        decoration:  InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                            prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/Lock.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          _userPassword = value as String;
                        },
                        obscureText: true,

                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      "Or Continue With",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF09051C),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          margin: const EdgeInsets.all(2),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: signInWithGoogle,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/google-icon.png',
                                  height: 36.0,
                                ),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 2.0, right: 2.0),
                                    child: const Text(
                                      "Google",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 12),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()))
                      },
                      child: Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    GradientButton(
                      text: "Login",
                      function: _trySubmit,
                      buttonWidth: 150,
                    ),
                    const SizedBox(height: 10),
                 // if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child:const Text('Signup Instead?'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
