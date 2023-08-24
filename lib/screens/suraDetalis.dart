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
    double h=MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;
    double containerHight=h*0.75;
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
          padding: const EdgeInsets.only(top: 15),
          child: Container(
              height:containerHight,
                width: w * 0.85,
            decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.2), Colors.white],
                    ),
                    borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                   SizedBox(
                    height: h * 0.05,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "سوره ${args.suraName}",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font2"),
                      ),
                      const Icon(
                        Icons.play_circle,
                        size: 45,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 3,
                    color: AppColores.primaryColor,
                    padding: const EdgeInsets.only(left: 5),
                  ),
                  const SizedBox(height: 8,),

                   SizedBox(
                    height: containerHight-containerHight*0.2,
                     child: SingleChildScrollView(
                       child: Column(
                         children: 
                           Soura(),
                         
                       ),
                     ),
                   ),
              
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
 // ignore: non_constant_identifier_names
 List<Text> Soura() {
    return List.generate(suraLines.length, (index) {
      return Text("${suraContent[index]}(${index+1})",
        style: const TextStyle(
            fontSize: 20,
            fontFamily: "font2",
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      );
    });
  }
 
  void readFile(String fileName) async{
    suraContent = await rootBundle.loadString("assets/files/$fileName");
   suraLines = suraContent.trim().split("\n");
   setState(() {});
  }
}

class SuraDetailsArgs{
  String suraName;
  String fileName;
  SuraDetailsArgs({required this.suraName,required this.fileName});
}