import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyCustomTextField_Center extends StatelessWidget {
  final controller;
  final String title;
  final title_color;
  final text_color;
  const MyCustomTextField_Center({Key? key, required this.title, this.controller, this.title_color, this.text_color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      textAlign: TextAlign.center,
      style: TextStyle(color: this.text_color ?? myLight, fontWeight: FontWeight.w200),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.all(10),
        hintText: this.title,
        hintStyle: TextStyle(color: this.title_color ?? myLight, fontWeight: FontWeight.w200),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent),),
      ),
    );
  }
}
