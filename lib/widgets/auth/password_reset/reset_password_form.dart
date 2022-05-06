import 'package:flutter/material.dart';

import '../../../screens/auth/password_reset/password_reset_success_screen.dart';
import '../../../designs/gradient_button.dart';

class ResetPasswordForm extends StatefulWidget {
  // final void Function(
  //   String password,
  //   BuildContext ctx,
  // ) submitFn;

  // bool isLoading;

  // ResetPasswordForm(
  //   this.submitFn,
  //   this.isLoading,
  // );
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  var _userPassword = '';

  // void _trySubmit() {
  //   final isValid = _formKey.currentState.validate();
  //   FocusScope.of(context).unfocus();

  //   if (isValid) {
  //     _formKey.currentState.save();
  //     widget.submitFn(
  //       _userPassword.trim(),
  //       context,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const  Alignment(0,0),
      child: Container(
        margin:  const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Padding(
            padding: const  EdgeInsets.all(5),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      margin: const  EdgeInsets.all(5),
                      padding: const  EdgeInsets.symmetric(
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
                        key: const  ValueKey('new_password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Enter password of atleast 7 character';
                          }
                          return null;
                        },
                        decoration: const  InputDecoration(
                          labelText: 'New Password',
                          border: InputBorder.none,
                        ),
                        onSaved: (value) {
                          _userPassword = value as String;
                        },
                        obscureText: true,
                      ),
                    ),
                  ),
                  const  SizedBox(height: 10),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 60,
                      width: 325,
                      margin:  const EdgeInsets.all(5),
                      padding: const  EdgeInsets.symmetric(
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
                        key: const  ValueKey('confirm_password'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Enter password of atleast 7 character';
                          }
                          return null;
                        },
                        decoration: const  InputDecoration(
                          labelText: 'Confirm Password',
                          border: InputBorder.none,
                        ),
                        onSaved: (value) {
                          _userPassword = value as String;
                        },
                        obscureText: true,
                      ),
                    ),
                  ),
               const     SizedBox(height: 175),
                  // if (widget.isLoading) CircularProgressIndicator(),
                  // if (!widget.isLoading)
                    GradientButton(
                      text: "Next",
                      function: () => {},
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             PasswordResetSuccessScreen())),
                      buttonWidth: 150,
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
