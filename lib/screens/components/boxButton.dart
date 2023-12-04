import 'package:flutter/material.dart';

import 'box.dart';

class BoxButton extends StatelessWidget {
  double height,width;
  Widget text;
  Widget icon;

  BoxButton(this.text,this.icon, this.height, this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        splashColor: const Color.fromARGB(255, 206, 206, 206).withOpacity(0.2),
        customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: SimpleBox(text,icon,height,width),
        onTap: () {
          print('Container tapped!');
        },
      ),
    );
  }
}
