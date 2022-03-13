import 'package:flutter/material.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';

import 'custom_text.dart';

void MyDialog(context, title, dialog, accept) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              MyCustomText(text: title, weight: FontWeight.w200,),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(dialog, style: TextStyle(fontWeight: FontWeight.w200),)
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: MyCustomButton(text: "확인", onPressed: accept)),
                SizedBox(width: 5,),
                Expanded(child: MyCustomButton(text: "취소", onPressed: () {Navigator.pop(context);})),
              ],
            )
          ],
        );
      });
}