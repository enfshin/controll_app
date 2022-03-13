import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';

void Myloading(context, title) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10,),
              MyCustomText(text: title, size: 16.0, weight: FontWeight.w200,),
              SizedBox(height: 10,),
              CircularProgressIndicator(
                color: myLightGreen,
              ),
              SizedBox(height: 10,)
            ],
          ),
        );
      });
}
