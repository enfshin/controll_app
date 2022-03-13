import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyScrollbarHorizonTouch extends StatelessWidget {
  final controller;
  final child;

  const MyScrollbarHorizonTouch({Key? key, this.controller, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: RawScrollbar(
        controller: this.controller,
        // isAlwaysShown: true,
        thumbColor: myLightGreen,
        radius: Radius.circular(20),
        thickness: 10,
        interactive: true,
        child: this.child
      ),
    );
  }
}
