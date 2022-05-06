import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
 final VoidCallback? function ;

  String? text;
  double? buttonWidth;
  GradientButton({this.text , this.function, this.buttonWidth});

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: RaisedButton(
        onPressed: widget.function,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding:const EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient:const LinearGradient(
                colors: [
                  Color(0xff54C0BC),
                  Color(0xff1fc585),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: widget.buttonWidth as double, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              widget.text as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
