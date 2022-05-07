import 'package:flutter/material.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String password,
    String username,
    
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  bool isLoading;

  AuthForm(
    this.submitFn,
    this.isLoading,
  );
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
 

 

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    


    
    if (isValid) {
      _formKey.currentState?.save();
      widget.submitFn(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
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
                  if (!_isLogin)
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
                  
                  const SizedBox(height: 12),
                  if (widget.isLoading) CircularProgressIndicator(),
                  if (!widget.isLoading)
                    RaisedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Login' : 'Sign Up'),
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      textColor: Theme.of(context).accentColor,
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                          _isLogin ? 'Signup Instead' : 'Already signed in'),
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
