
import 'package:flutter/material.dart';
import 'package:newapp/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          primaryTextTheme: TextTheme(
              body1: TextStyle(
            color: Colors.white,
          ))),
      home: HomePage(),
    );
  }
}
