import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "urbanist",
        textTheme: TextTheme(
          headline1: TextStyle(
            color: themeDarkColor,
            fontSize: 35,
            letterSpacing: .5,
          ),
          bodyText1: TextStyle(letterSpacing: .5),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
