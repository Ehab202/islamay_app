// ignore_for_file: must_be_immutable., prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:islamay_app/screens/homescreen/taps/hadethTap.dart';
import 'package:islamay_app/screens/homescreen/taps/quranTap.dart';
import 'package:islamay_app/screens/homescreen/taps/radioTap.dart';
import 'package:islamay_app/screens/homescreen/taps/sebhaTap.dart';
import 'package:islamay_app/themeData.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   int selectedTapIndex=0;
   List<Widget>taps=[
     QuranTap(),
     HadethTap(),
      SebhaTap(),
    const RadioTap(),
   ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/default_bg.png"),fit: BoxFit.fill),
      ),
      child: Scaffold(
        body: taps[selectedTapIndex],
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Islami",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColores.accentColor),)),
        bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColores.primaryColor),
        child: BottomNavigationBar(
          onTap: (index) {
            selectedTapIndex=index;
            setState(() {
              
            });
         
          },
          currentIndex:selectedTapIndex ,
            selectedItemColor: AppColores.accentColor,
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_quran.png")),
                  label: "quran"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_hadeth.png")),
                  label: "hadeth"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_sebha.png")),
                  label: "sebha"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icon_radio.png")),
                  label: "radio"),
            ]),
      )),
    );
  }
}
