import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {

  String text;


  AppbarWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:Text(this.text, style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.orangeAccent);
  }
}
