import 'package:app/practiceOne/HomePageOne.dart';
import 'package:app/practiceTwo/ui/HomePageTwo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloC Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: HomePageOne(),
      home: HomePageTwo(),
    );
  }
}
