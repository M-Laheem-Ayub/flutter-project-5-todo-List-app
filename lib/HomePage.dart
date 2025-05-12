// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_5/AddNewPopUp.dart';
import 'package:flutter_application_5/MainPage.dart';
import 'package:flutter_application_5/MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool increaseWidth = false;
  bool isDark = false;
  bool isPopUp = false;
  List notes = [
    ["Submit Flutter development assignment", false],
    ["Read 10 pages of assigned reading material", false],
    ["Perform daily fitness routine", false],
    ["Watch Flutter/Dart tutorial for skill enhancement", false],
    ["Update and refine professional resume", false],
  ];
  void addNewTask(String task) {
    setState(() {
      notes.add([task, false]);
    });
  }

  void darkMode() {
    setState(() {
      isDark = !isDark;
    });
  }

  void sideBarArgester() {
    setState(() {
      increaseWidth = !increaseWidth;
    });
  }

  void popUp() {
    setState(() {
      isPopUp = !isPopUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? Color(0xff101218) : Colors.white,
        appBar: AppBar(
          shadowColor: isDark ? Colors.white : Colors.black,
          elevation: increaseWidth ? 2 : 0,
          backgroundColor: isDark ? Color(0xff101218) : Colors.white,
          leading: IconButton(
            onPressed: () {
              sideBarArgester();
            },
            icon: Icon(
              increaseWidth ? Icons.arrow_back_outlined : Icons.menu,
              color: isDark ? Colors.white : Color(0xff363e45),
            ),
          ),
        ),
        body: Stack(
          children: [
            MainPage(isDark: isDark, notes: notes),

            MyDrawer(
              increaseWidth: increaseWidth,
              isDark: isDark,
              darkMode: darkMode,
              popUp: popUp,
            ),

            AddNewPopUp(isPopUp: isPopUp, popUp: popUp, addNewTask: addNewTask),
          ],
        ),
      ),
    );
  }
}
