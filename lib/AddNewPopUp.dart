// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class AddNewPopUp extends StatelessWidget {
  AddNewPopUp({
    super.key,
    required this.isPopUp,
    required this.popUp,
    required this.addNewTask,
  });
  bool isPopUp;
  Function popUp, addNewTask;
  final TextEditingController _controller = TextEditingController();
  String? isEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Task cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 60),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(128, 128, 128, 0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            width: isPopUp ? 330 : 0,
            height: isPopUp ? 250 : 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        popUp();
                      },
                      icon: Icon(Icons.close_rounded),
                    ),
                  ],
                ),
                Text(
                  "Add New Task",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: TextFormField(
                    controller: _controller,
                    validator: isEmpty,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      focusColor: Colors.black,
                      hintText: "Task",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    popUp();
                    addNewTask(_controller.text.toString());
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
