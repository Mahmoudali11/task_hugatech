import 'package:flutter/material.dart';
import 'package:task_hugatech/provider/userProfile_provider.dart';
import 'package:task_hugatech/provider/userdata_provider.dart';
import 'package:task_hugatech/provider/userlogin_provider.dart';
import 'package:task_hugatech/screens/login.dart';
import 'package:task_hugatech/screens/theme/style.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
   ChangeNotifierProvider(create: (context)=>Profiles()),
   ChangeNotifierProvider(create: (context)=>UserLogins()),
    ChangeNotifierProvider(create: (context)=>UserData())



    ],child: MaterialApp(
      title: "dsf",
       theme: apptheme,
      home:LoginScreen(),
    )
    
    ,) ;
  }
}
 