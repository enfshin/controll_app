import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_text.dart';

void MyStartBidDialog(context, pro, basic) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              MyCustomText(text: "자동입찰 모드", weight: FontWeight.w200,),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyCustomText(text: "어떤 모드로 자동입찰 하시겠습니까?", weight: FontWeight.w200,),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: MyCustomButton(text: "프로 모드", onPressed: pro)),
                SizedBox(width: 5,),
                Expanded(child: MyCustomButton(text: "베이직 모드", onPressed: basic)),
              ],
            )
          ],
        );
      });
}
