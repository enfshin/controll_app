import 'package:controll_app/constants/global_variables.dart';
import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/widgets/custom/custom_alert.dart';
import 'package:controll_app/widgets/custom/custom_button.dart';
import 'package:controll_app/widgets/custom/custom_loading.dart';
import 'package:controll_app/widgets/custom/custom_text.dart';
import 'package:controll_app/widgets/custom/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProRunPage extends StatefulWidget {
  const ProRunPage({Key? key}) : super(key: key);

  @override
  _ProRunPageState createState() => _ProRunPageState();
}

class _ProRunPageState extends State<ProRunPage> {
  final _scrollcontroller = ScrollController();
  List<conduct_data> conduct_list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: myDarkBlue,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyCustomButton(text: "프로모드 확인", onPressed: () {
                valid_conduct();
              },),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(border: Border.all(color: myLightGreen, width: 1), borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(
                  controller: _scrollcontroller,
                  scrollDirection: Axis.horizontal,
                  child: IconTheme(
                    data: IconThemeData(color: myLight),
                    child: DataTable(
                      columnSpacing: 35,
                      decoration: BoxDecoration(color: myLight.withOpacity(.1)),
                      columns: [
                        DataColumn(label: MyCustomText(text: "인덱스", color: myLightGreen, size: 12.0),),
                        DataColumn(label: MyCustomText(text: "아이디", color: myLightGreen, size: 12.0),),
                        DataColumn(label: MyCustomText(text: "시간", color: myLightGreen, size: 12.0),),
                        DataColumn(label: MyCustomText(text: "로그", color: myLightGreen, size: 12.0)),
                      ],
                      rows: List<DataRow>.generate(conduct_list.length, (index) =>
                          DataRow(
                              color: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    if (index.isEven) {
                                      return myLight.withOpacity(0.1);
                                    }
                                    return null;
                                  }),
                              cells: [
                                DataCell(MyCustomText(text: conduct_list[index].index, color: myLight, size: 10.0, weight: FontWeight.w200,)),
                                DataCell(MyCustomText(text: conduct_list[index].user_id, color: myLight, size: 10.0, weight: FontWeight.w200,)),
                                DataCell(MyCustomText(text: conduct_list[index].time, color: myLight, size: 10.0, weight: FontWeight.w200,)),
                                DataCell(MyCustomText(text: conduct_list[index].log, color: myLight, size: 10.0, weight: FontWeight.w200,)),
                              ]
                          ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }

  Future<void> valid_conduct() async {
    Myloading(context, "프로모드 자동입찰 확인 중");
    var params1 = "?flag=" + "프로모드 자동입찰 확인";
    var params2 = "&param=" + '{"ID" : "test1"}';
    var url = Uri.parse(BaseUrl + params1 + params2);
    var response = await http.get(url).timeout(Duration(seconds: 120));
    var apiResponse = json.decode(utf8.decode(response.bodyBytes).replaceAll("'", '"'));
    Navigator.of(context).pop();
    if (apiResponse['result'] == "실패") {
      return MyAlert(context, "실패 안내", apiResponse['message']);
    }
    if (apiResponse['result'] == "성공") {
      var data_list = apiResponse["message"];
      for (int i=0; i<data_list.length; i++) {
        var log_list = data_list[i][2].split("/");
        var keyword_len = log_list.length;
        conduct_list.add(
            conduct_data(
              index: data_list[i][0].toString(),
              user_id: data_list[i][1],
              time: data_list[i][3],
              log: keyword_len.toString(),
            )
        );
      }
    }
    setState(() {});
  }

}

class conduct_data {
  conduct_data({
    required this.index,
    required this.user_id,
    required this.time,
    required this.log,
  });

  String index;
  String user_id;
  String time;
  String log;
}