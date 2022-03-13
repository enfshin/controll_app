import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyContainerWithText extends StatelessWidget {
  final String text;
  final color;
  final textsize;
  final Widget innerwidget;
  const MyContainerWithText({Key? key,  required this.text, required this.innerwidget, this.color, this.textsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDecorator( // 기간
        decoration: InputDecoration(
          labelStyle: TextStyle(color: myLight, fontSize: this.textsize ?? 16, fontWeight: FontWeight.w200),
          labelText: this.text,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: this.color ?? myDarkGreen),
          ),
        ),
        child: this.innerwidget
    );
  }
}
