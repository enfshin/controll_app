import 'package:flutter/material.dart';
import 'package:controll_app/constants/global_variables.dart';
import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/custom_text.dart';

class PageTitle extends StatefulWidget {
  final title;
  const PageTitle({Key? key, this.title}) : super(key: key);

  @override
  _PageTitleState createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        MyCustomText(text: widget.title, size: (_width < smallSceenSize) ? 18 : 24, color: myLight, weight: FontWeight.w400,),
      ],
    );
  }
}
