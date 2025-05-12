// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isDark,
  });
  String title;
  IconData icon;
  bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white12 : Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),

        height: 50,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 10,
            children: [
              Icon(icon, color: isDark ? Colors.white : Colors.black),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
