import 'package:flutter/material.dart';
import 'package:gruharaksha/pages/homepage.dart';
import 'data/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19 Tracker Global',
      theme: ThemeData(
          primaryColor: kBackgroundColor,
        brightness: Brightness.light
      ),
      home: HomeScreen(),
    );
  }
}

