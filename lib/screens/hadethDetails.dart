// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamay_app/themeData.dart';

class HadethDetails extends StatefulWidget {
  const HadethDetails({super.key});
   static String routeName = "hadeth_details";

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  String hadethContent='';
  int index=0;
  @override
  Widget build(BuildContext context) {
    int args = ModalRoute.of(context)!.settings.arguments as int ;
    // ignore: avoid_print
    print(args);
    if(hadethContent.isEmpty) readFile(index);

    return Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/default_bg.png"),fit: BoxFit.fill),
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Islami",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColores.accentColor),)),
        body:
                hadethContent.isEmpty?
                const Center(child: CircularProgressIndicator()):
                SingleChildScrollView(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(hadethContent,style: TextStyle(fontSize: 25,color: AppColores.accentColor,),textAlign: TextAlign.center,),
                )),
      ),
    );
  }
void readFile(int index) async{
    hadethContent = await rootBundle.loadString("assets/hadethFiles/h${index+1}.txt");
   setState(() {});
  }
}

