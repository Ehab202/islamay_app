// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:islamay_app/screens/hadethDetails.dart';
import 'package:islamay_app/screens/homescreen/home.dart';
import 'package:islamay_app/screens/suraDetalis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName:(context) => Home(),
        SuraDetails.routeName:(context) => SuraDetails(),
        HadethDetails.routeName:(context) => HadethDetails(),
        
      },
      initialRoute: Home.routeName,
    );
  }
}
