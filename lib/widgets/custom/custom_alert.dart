import 'package:flutter/material.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

void MyAlert(context, title, dialog) {
  showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
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
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: MyCustomButton(text: "확인", onPressed: () {
                  HapticFeedback.heavyImpact();
                  Navigator.pop(context);
                })),
              ],
            )
          ],
        );
      });
}
