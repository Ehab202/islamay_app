// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamay_app/themeData.dart';


class SuraDetails extends StatefulWidget {
  static String routeName = "sura_details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraLines = [];
  String suraName='';
   String suraContent='';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if(suraLines.isEmpty) readFile(args.fileName);

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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("  سوره ${args.suraName}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColores.accentColor),),
                  const SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 3,
                    color: AppColores.primaryColor,
                    padding: const EdgeInsets.only(left: 5),
                  ),
                   suraContent.isEmpty?
                                   const Center(child: CircularProgressIndicator()):
                                   Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(suraContent,style: TextStyle(fontSize: 25,color: AppColores.accentColor,),textAlign: TextAlign.center,),
                                   ),
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void readFile(String fileName) async{
    suraContent = await rootBundle.loadString("assets/files/$fileName");
   suraLines = suraContent.split("\n");
   setState(() {});
  }
}

class SuraDetailsArgs{
  String suraName;
  String fileName;
  SuraDetailsArgs({required this.suraName,required this.fileName});
}