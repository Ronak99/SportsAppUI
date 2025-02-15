import 'package:flutter/material.dart';

import 'ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'urbanist'),
      home: HomeScreen(),
    );
  }
}
