import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyCustomTextField4Form extends StatelessWidget {
  final String text;
  final hintText;
  final hintStyleNeeds;
  final controller;
  const MyCustomTextField4Form({Key? key, required this.text, this.hintText, this.hintStyleNeeds, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller ?? null,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: this.text,
            labelStyle: TextStyle(color: myLight, fontWeight: FontWeight.w200),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
            hintText: this.hintText ?? null,
            hintStyle: (this.hintStyleNeeds == true) ? TextStyle(color: myLightGray, fontSize: 12, fontWeight: FontWeight.w200) : null
        )
    );
  }
}
