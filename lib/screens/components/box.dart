import 'package:flutter/material.dart';

import '../../utility/style.dart';

class SimpleBox extends StatelessWidget {
  Widget text;
  Widget icon;

  double height;
  double width;

  SimpleBox(this.text, this.icon,  this.height, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      padding: const EdgeInsets.all(10),
      //width: (width/4)-10, // Set your desired width
      //height: 70, // Set your desired height
      decoration: BoxDecoration(
        color: accent,
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 206, 206, 206).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text,
          const SizedBox(width: 20,),
          icon,
        ],
      ),
    );
  }
}