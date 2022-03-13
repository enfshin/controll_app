import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

import 'custom_text.dart';

class MyButton extends StatelessWidget {
  final String text;
  final onTap;
  final textcolor;

  const MyButton({Key? key,
    required this.text,
    this.onTap, this.textcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        highlightColor: myLightGreen,
        onTap: this.onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCustomText(
              text: this.text,
              size: 15,
              weight: FontWeight.w200,
              color: this.textcolor ?? myLight,
            )
          ],
        )
    );
  }
}


