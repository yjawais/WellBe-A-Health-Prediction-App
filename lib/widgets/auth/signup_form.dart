// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import '../../designs/gradient_button.dart';
import '../../screens/auth/login_screen.dart';

class SignupForm extends StatefulWidget {
  final void Function(
    String username,
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;

  bool isLoading;

  SignupForm(
   
    this.submitFn,
    this.isLoading,
    { Key? key,}
  ) : super(key: key);
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  var _userEmail = '';

  var _userPassword = '';

  bool rememberMe = false;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _userName.trim(),
        _userEmail.trim(),
        _userPassword.trim(),
        context,
      );
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const  Alignment(0, 1.2),
      child: Container(
        margin:  const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding:  const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const  EdgeInsets.symmetric(horizontal: 10),
                    child: const  Text(
                      "Sign Up For Free",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF09051C),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                 const   SizedBox(height: 25),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      margin: const  EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
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
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Enter more than 4 character';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/Profile.png',
                              width: 24,
                              height: 24,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onSaved: (value) {
                          _userName = value as String;
                        },
                      ),
                    ),
                  ),
                 const   SizedBox(height: 5),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      padding: const  EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // border: Border.all(
                        //   color: Color(0xfff4f4f4),
                        //   width: 1,
                        // ),
                      ),
                      margin:  const EdgeInsets.all(5),
                      child: TextFormField(
                        key: const  ValueKey('email'),
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
                  const  SizedBox(height: 5),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      margin: const  EdgeInsets.all(5),
                      padding: const  EdgeInsets.symmetric(
                        horizontal: 10,
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
                        key: const  ValueKey('password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Enter password of atleast 7 character';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
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
                  
                  const  SizedBox(height: 25),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    GradientButton(
                      function: _trySubmit,
                      text: 'Create Account',
                      buttonWidth: 175,
                    ),
                    const  SizedBox(height: 15),
                 // if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).colorScheme.secondary,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const LoginScreen()));
                      },
                      child: const  Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
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
