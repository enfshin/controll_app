import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';
import 'package:controll_app/widgets/custom/mybutton.dart';
import 'package:flutter/material.dart';

class ValidConductPage extends StatefulWidget {
  const ValidConductPage({Key? key}) : super(key: key);

  @override
  _ValidConductPageState createState() => _ValidConductPageState();
}

class _ValidConductPageState extends State<ValidConductPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: myDarkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyCustomButton(text: "사용기한 차감", onPressed: () {
            valid_conduct();
          },),

        ],
      )
    );
  }

  void valid_conduct() {

  }
}
