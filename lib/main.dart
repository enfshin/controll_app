import 'package:controll_app/pages/homepage.dart';
import 'package:flutter/material.dart';

import 'constants/my_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title : "LIFEROI",
      theme: ThemeData(
          fontFamily: "SCDream",
          scaffoldBackgroundColor: myDarkWhite,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.blue
      ),
      home: HomePage(),

    );
  }
}

