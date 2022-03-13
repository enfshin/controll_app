import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyCustomTextForm extends StatelessWidget {
  final String text;
  final onValidate;
  const MyCustomTextForm({Key? key, required this.text, this.onValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField( // Customer_ID
      style: TextStyle(color: Colors.white, fontSize: 12),
      decoration: InputDecoration(
        labelText: this.text,
        labelStyle: TextStyle(color: myLight, fontWeight: FontWeight.w200),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.greenAccent)),
      ),
      validator: this.onValidate,
    );
  }
}
