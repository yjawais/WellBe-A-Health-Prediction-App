// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final int value;
  const DialogBox(
    this.value, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(
                      value == 0 ? 'Congrats!' : 'Warning !',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      value == 0
                          ? 'You are at low risk'
                          : 'You are at high risk.',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: value == 0 ? Colors.greenAccent : Colors.redAccent,
                      child: const Text(
                        'Okay',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor:
                      value == 0 ? Colors.greenAccent : Colors.redAccent,
                  radius: 60,
                  child: Icon(
                    value == 0
                        ? Icons.assistant_photo
                        : Icons.dangerous_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                )),
          ],
        ));
  }
}
