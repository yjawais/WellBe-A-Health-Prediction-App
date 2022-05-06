import 'package:flutter/material.dart';
import '../../../designs/background.dart';
import '../../../widgets/auth/password_reset/reset_password_form.dart';

class ResetPasswordScreen extends StatefulWidget {
// @override
// Future<void> resetPassword(String email) async {
//     await _firebaseAuth.sendPasswordResetEmail(email: email);
// }

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children:[ 
            Background(),
            Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
           leading: GestureDetector(
                        onTap: () => {
                            Navigator.of(context).pop()
                        },
                        child: const  Image(
                          image: AssetImage('assets/images/IconBack.png'),
                          alignment: Alignment.center,
                        ),
                      ),
          // IconButton(
          //     icon: Icon(Icons.arrow_back_ios, color: Color(0xffda6317)),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     }),
        ),
        body: SingleChildScrollView(
                child: Container(
            margin: const  EdgeInsets.all(10),
            padding: const  EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const  Text(
                  'Reset your password here',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff09051C),
                  ),
                ),
               const   SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 225,
                  child: const  Text(
                    'Enter New password',
                    style: TextStyle(
                        fontSize: 12, color: Color(0xff000000), height: 1.5),
                  ),
                ),

                Container(alignment: const  Alignment(0, 1.5), child: ResetPasswordForm()),
               
              ],
            ),
          ),
        ),
      ),],
    );
  }
}
