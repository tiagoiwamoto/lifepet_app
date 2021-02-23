import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetBuilder {

  WidgetBuilder();

  Widget textBuilder(String value, double valueSize){
    return Text(
      value,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: valueSize,
          fontWeight: FontWeight.normal,
          color: Colors.grey),
    );
  }
}