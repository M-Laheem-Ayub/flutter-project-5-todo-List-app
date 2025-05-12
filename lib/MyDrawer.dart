// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_5/DrawerTile.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({
    super.key,
    required this.increaseWidth,
    required this.isDark,
    required this.darkMode,
    required this.popUp,
  });
  bool increaseWidth;
  bool isDark;
  Function darkMode, popUp;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  _MyDrawerState();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: widget.increaseWidth ? 250 : 0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
                  widget.isDark
                      ? Color.fromRGBO(255, 255, 255, 0.05)
                      : Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(5, 0),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          // border: Border(right: BorderSide(color: Colors.white, width: 1)),
          color: widget.isDark ? Color(0xff101218) : Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              width: 238,
              height: 220,
              decoration: BoxDecoration(
                color: widget.isDark ? Colors.white12 : Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  CircleAvatar(
                    radius: 60,
                    child: Image.asset("assets/images/profile-img.png"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Laheem Ayub",
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    "Laheem.ayub.dev@gmail.com",
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            GestureDetector(
              onTap: () {
                widget.darkMode();
              },
              child: DrawerTile(
                icon:
                    widget.isDark
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                title: widget.isDark ? "Light Mode" : "Dark Mode",
                isDark: widget.isDark,
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.popUp();
              },
              child: DrawerTile(
                icon: Icons.add,
                title: "Add New Task",
                isDark: widget.isDark,
              ),
            ),
            DrawerTile(
              icon: Icons.settings,
              title: "Setting",
              isDark: widget.isDark,
            ),
            DrawerTile(
              icon: Icons.menu_book_rounded,
              title: "About",
              isDark: widget.isDark,
            ),
            DrawerTile(
              icon: Icons.lock_open_rounded,
              title: "Logout",
              isDark: widget.isDark,
            ),
          ],
        ),
      ),
    );
  }
}
