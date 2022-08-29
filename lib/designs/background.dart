import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    
       Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.25,
                0.75,
                0.9,
              ],
              colors: [
                  Color(0xffd2f6fc),
                   Color(0xffd7f8e8),
                    Color(0xfff0fff3),
                Color(0xff9df3c4),
                
              ],
            )
          ),
          
      
      
    );
  }
}
