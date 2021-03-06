import 'package:flutter/material.dart';

class PetTextStyle extends StatelessWidget {

  String text;
  String type;
  String fontFamily;
  double fontSize;
  FontWeight fontWeight;


  PetTextStyle({this.text, this.type});

  @override
  Widget build(BuildContext context) {
    _setConfig(type);
    return Text(text, style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight
    ));
  }

  void _setConfig(String type){
    if(type == 'header'){
      fontFamily = "Montserrat";
      fontSize = 24;
      fontWeight = FontWeight.bold;
    }
  }
}
