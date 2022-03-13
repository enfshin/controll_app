import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

class MyCustomButton extends StatelessWidget {
  final String text;
  final size;
  final textcolor;
  final onPressed;
  final height;
  final width;
  final weight;

  const MyCustomButton({Key? key, required this.text, this.size, this.onPressed, this.textcolor, this.height, this.width, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 40,
      width: this.width ?? null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFF3fd89f), Color(0xFF3eb9b4)],
              begin: FractionalOffset(0.9, 0.0),
              end: FractionalOffset(1.0, 1.5),
              stops: [0.0, 0.8],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(myDarkGreen),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
          ),
          child: Text(this.text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: this.size ?? 16.0, color: this.textcolor ?? myDarkBlue, fontWeight: this.weight ?? FontWeight.w200),
          ),
          onPressed: this.onPressed ?? () {},
        ),
      ),
    );
  }
}