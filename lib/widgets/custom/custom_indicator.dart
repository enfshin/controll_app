import 'package:controll_app/constants/global_variables.dart';
import 'package:controll_app/constants/my_style.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class MyIndicator extends StatelessWidget {
  const MyIndicator({Key? key, this.text, this.title}) : super(key: key);
  final text;
  final title;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(8),
      height: _width/7,
      width: _width/7,
      decoration: BoxDecoration(
        border: Border.all(color: myLightGreen, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: myLight.withOpacity(.1),
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            MyCustomText(
              text: this.title,
              weight: FontWeight.w200,
              size: (MediaQuery.of(context).orientation == Orientation.landscape) ? _width/60 : _width/40,
            )
          ],),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCustomText(
                text: this.text,
                color: myLight,
                size: (MediaQuery.of(context).orientation == Orientation.landscape) ? _width/60 : _width/40,
                weight: FontWeight.w200,)
            ],
          )),
        ],
      ),
    );
  }
}
