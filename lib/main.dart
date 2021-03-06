import 'package:flutter/material.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/home/home_screen.dart';
import 'file:///W:/Workspace/flutter/lifepet_app/lib/screens/login/login_screen.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pet Life",
      home: new LoginScreen(),
      theme: ThemeData(
        primaryColor: Colors.redAccent
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
