import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';

import 'custom_text.dart';

class MyDropDown extends StatefulWidget {
  final List<String> droplist;

  MyDropDown({Key? key, required this.droplist}) : super(key: key);

  @override
  MyDropDownState createState() => MyDropDownState();
}

class MyDropDownState extends State<MyDropDown> {
  late String dropdownValue = widget.droplist[0];

  returnValue() {
    return dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          isExpanded: true,
          isDense: true,
          iconEnabledColor: myLight,
          dropdownColor: myLightGray,
          style: TextStyle(color: myLight, fontSize: 16),
          underline: Text(""),
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: widget.droplist.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomText(text: value, color: myLight, weight: FontWeight.w200,),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
