// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:islamay_app/screens/hadethDetails.dart';
import 'package:islamay_app/themeData.dart';

// ignore: must_be_immutable
class HadethTap extends StatelessWidget {
   
  List<int>hadethName=List.generate(50,((index) => index));

  HadethTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.asset("assets/hadeth_logo.png")),
          const SizedBox(height: 4,),
          Container(
            width: double.infinity,
            height: 3,
            color: AppColores.primaryColor,
          ),
          Text("Hadeth Name",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: AppColores.accentColor),textAlign: TextAlign.center,),
           Container(
            width: double.infinity,
            height: 3,
            color: AppColores.primaryColor,
          ),
           Expanded(
            flex: 7,
            child:ListView.builder(
              itemBuilder: (context, index) {
                return buildhadethName(context,index) ;
              },
              itemCount: hadethName.length,
              ))            
        
          
          
      ],
    );
  }
  Widget buildhadethName(BuildContext context ,int index){
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, HadethDetails.routeName,
        arguments:index
      
        );
      }, 
      child: Text("${index+1}حديث رقم",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: AppColores.accentColor,fontSize: 25),));
  }
}