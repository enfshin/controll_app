import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyBorderTextFormField extends StatelessWidget {
  final String text;
  final textColor;
  final labelColor;
  final hintText;
  final validator;
  final onSaved;
  final controller;
  const MyBorderTextFormField({Key? key, required this.text, this.validator, this.onSaved, this.textColor, this.hintText, this.controller, this.labelColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
          controller: this.controller ?? null,
          style: TextStyle(color: this.textColor ?? myDarkBlue, fontWeight: FontWeight.w200),
          decoration: InputDecoration(
            hintText: this.hintText,
            hintStyle: TextStyle(color: myLight, fontWeight: FontWeight.w200),
            labelText: this.text,
            labelStyle: TextStyle(color: this.labelColor ?? myLight, fontWeight: FontWeight.w200),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: myLightGreen, width: 2,),),
            border: OutlineInputBorder(borderSide: BorderSide(color: myLightGreen, width: 2,),),
          ),
          validator: this.validator ?? (value) {
            if (value == null || value.isEmpty) {
              return '위 입력란은 필수 입니다.';
            }
          },
          onSaved: this.onSaved
      ),
    );
  }
}
