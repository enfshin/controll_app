import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/border_textformfield.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';
import 'package:flutter/material.dart';

class ReChargePage extends StatefulWidget {
  const ReChargePage({Key? key}) : super(key: key);

  @override
  _ReChargePageState createState() => _ReChargePageState();
}

class _ReChargePageState extends State<ReChargePage> {
  final ID_controller = TextEditingController();
  final Price_controller = TextEditingController();
  final Mode_controller = TextEditingController();
  List<String> mode_list = ["애드스코프", "애드핀 - 스타터", "애드핀 - 베이직", "애드핀 - 프로"];
  late String mode = mode_list[0];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: myDarkBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyBorderTextFormField(text: "아이디", textColor: myLight, labelColor: myLight, controller: ID_controller,),
            SizedBox(height: 10,),
            MyBorderTextFormField(text: "금액", textColor: myLight, labelColor: myLight, controller: Price_controller,),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(border: Border.all(color: myLightGreen, width: 2), borderRadius: BorderRadius.circular(4)),
              height: 55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    isExpanded: true,
                    isDense: true,
                    iconEnabledColor: myLight,
                    dropdownColor: myLightGray,
                    menuMaxHeight: 500.0,
                    style: TextStyle(color: myLight, fontSize: 16),
                    underline: Text(""),
                    value: mode,
                    onChanged: (String? newValue) {
                      setState(() {
                        mode = newValue!;
                      });
                    },
                    items: mode_list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(value),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            MyCustomButton(text: "사용기한 추가", onPressed: () {
              recharge();
            },),

          ],
        )
    );
  }

  void recharge() {

  }
}
