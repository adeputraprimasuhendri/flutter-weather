import 'package:flutter/material.dart';
import 'package:weather/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather App',
      home: Homepage(),
    );
  }
}