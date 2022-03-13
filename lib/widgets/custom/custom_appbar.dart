import 'package:controll_app/widgets/custom/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:controll_app/constants/my_style.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar custom_AppBar(BuildContext context, title) =>
    AppBar(
      backgroundColor: myLightBlue,
      elevation: 0,
      leading: IconButton(
        icon: Icon(MdiIcons.arrowLeft),
        onPressed: () {
          HapticFeedback.heavyImpact();
          Navigator.pop(context);
        },
      ),
      title: MyCustomText(text: title, size: 20, weight: FontWeight.bold, color: myLight,),
      actions: [
        IconButton(
          icon: Icon(MdiIcons.commentQuestionOutline),
          onPressed: () async {
            HapticFeedback.heavyImpact();
            const url = "http://pf.kakao.com/_UXcVxb/chat";
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw "카카오톡 문의하기 연결에 오류가 있습니다. 홈페이지에서 문의 해주시기 바랍니다.";
            }
          },
        ),
        SizedBox(width: 10,),
      ],
    );



