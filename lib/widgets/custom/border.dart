import 'package:controll_app/constants/my_style.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class MyBorder extends StatelessWidget {
  final innerWidget;

  const MyBorder({Key? key,
    this.innerWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: myLightGreen, width: 1),
            borderRadius: BorderRadius.circular(10)
        ),
        height: 40,
        alignment: Alignment.center,
        child: SizedBox.expand(
          child: this.innerWidget
        )
    );
  }
}


