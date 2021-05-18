import 'package:flutter/material.dart';
import 'package:task_hugatech/screens/login.dart';
import 'package:task_hugatech/screens/theme/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "dsf",
       theme: apptheme,
      home:LoginScreen(),
    );
  }
}
 