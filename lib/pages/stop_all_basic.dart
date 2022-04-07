import 'package:controll_app/constants/global_variables.dart';
import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/custom_alert.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';
import 'package:controll_app/widgets/custom/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StopBasicPage extends StatefulWidget {
  const StopBasicPage({Key? key}) : super(key: key);

  @override
  State<StopBasicPage> createState() => _StopBasicPageState();
}

class _StopBasicPageState extends State<StopBasicPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        color: myDarkBlue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyCustomButton(text: "베이직 정지", onPressed: () {
              stop_all_basic();
            },),
            SizedBox(height: 10,),
          ],
        )
    );
  }

  Future<void> stop_all_basic() async {
    Myloading(context, "베이직 정지 중");
    var params1 = "?flag=" + "베이직 정지";
    var params2 = "&param=" + '{"ID" : "test1"}';
    var url = Uri.parse(BaseUrl + params1 + params2);
    var response = await http.get(url).timeout(Duration(seconds: 120));
    var apiResponse = json.decode(utf8.decode(response.bodyBytes).replaceAll("'", '"'));
    Navigator.of(context).pop();
    if (apiResponse['result'] == "실패") {
      return MyAlert(context, "실패 안내", apiResponse['message']);
    }
    if (apiResponse['result'] == "성공") {
      MyAlert(context, "안내", "사용기한 차감 성공");
    }
  }
}
