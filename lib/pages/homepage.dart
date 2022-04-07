import 'package:controll_app/constants/my_style.dart';
import 'package:controll_app/pages/recharge_page.dart';
import 'package:controll_app/pages/stop_all_basic.dart';
import 'package:controll_app/pages/valid_conduct_page.dart';
import 'package:controll_app/widgets/custom/custom_main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<void> _onItemTapped(int index) async {
    setState(() {
      HapticFeedback.heavyImpact();
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    ValidConductPage(),
    ReChargePage(),
    StopBasicPage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Main_AppBar(context),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.calendarToday),
              label: '사용기한',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.calendarCheck),
              label: '재충전',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.stopCircleOutline),
              label: '베이직 정지',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme: IconThemeData(color: myLightGray.withOpacity(.9)),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          selectedItemColor: myLightGreen,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
