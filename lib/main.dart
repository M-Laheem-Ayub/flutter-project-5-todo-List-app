import 'package:flutter/material.dart';
import 'package:flutter_application_5/HomePage.dart';

//List / array
//ListView
//ListView.builder
//list.add()
//Gestordetector

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
