import 'package:controll_app/constants/global_variables.dart';
import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/border_textformfield.dart';
import 'package:controll_app/widgets/custom/custom_alert.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';
import 'package:controll_app/widgets/custom/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ReChargePage extends StatefulWidget {
  const ReChargePage({Key? key}) : super(key: key);

  @override
  _ReChargePageState createState() => _ReChargePageState();
}

class _ReChargePageState extends State<ReChargePage> {
  final ID_controller = TextEditingController();
  final Deposit_name_controller = TextEditingController();
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
            MyBorderTextFormField(text: "입금자명", textColor: myLight, labelColor: myLight, controller: Deposit_name_controller,),
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

  Future<void> recharge() async {
    Myloading(context, "사용기한 충전 중");
    var user_id = ID_controller.text;
    var deposit_name = Deposit_name_controller.text;
    var price = Price_controller.text;

    var params1 = "?flag=" + "사용기한 충전";
    var params2 = "&param=" + '{"ID" : \"$user_id\", "deposit_name" : \"$deposit_name\", "PRICE" : \"$price\", "MODE" : \"$mode\"}';
    var url = Uri.parse(BaseUrl + params1 + params2);
    var response = await http.get(url).timeout(Duration(seconds: 120));
    var apiResponse = json.decode(utf8.decode(response.bodyBytes).replaceAll("'", '"'));
    Navigator.of(context).pop();
    if (apiResponse['result'] == "실패") {
      return MyAlert(context, "실패 안내", apiResponse['message']);
    }
    if (apiResponse['result'] == "성공") {
      return MyAlert(context, "안내", apiResponse['message']);
    }

  }
}
