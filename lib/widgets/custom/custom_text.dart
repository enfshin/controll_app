import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  final String text;
  final double size;
  final color;
  final weight;

  const MyCustomText({Key? key, required this.text, this.size = 16, this.color, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: size,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.w200),
    );
  }
}
