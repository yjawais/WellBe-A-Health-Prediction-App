import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final int value;
  DialogBox(this.value);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(value==0?'Congrats!':'Warning !', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text(value==0?'You are at low risk':'You are at high risk.', style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  RaisedButton(onPressed: () {
                    Navigator.of(context).pop();
                  },
                    color: value==0?Colors.greenAccent:Colors.redAccent,
                    child: const Text('Okay', style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: CircleAvatar(
              backgroundColor: value==0?Colors.greenAccent:Colors.redAccent,
              radius: 60,
              child: Icon(value==0?Icons.assistant_photo:Icons.dangerous_rounded, color: Colors.white, size: 50,),
            )
          ),
        ],
      )
    );
  } 
}