import 'package:flutter/material.dart';
import 'package:wathaker_application/constants.dart';

BottomNavigationBar navBar(int index, BuildContext context) {
  return BottomNavigationBar(
    currentIndex: index,
    type: BottomNavigationBarType.fixed,
    backgroundColor: dark,
    iconSize: 30,
    selectedItemColor: yellow,
    unselectedItemColor: Colors.white,
    unselectedFontSize: 0,
    selectedFontSize: 0,
    elevation: 0,
    items: [
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/dua');
            },
            icon: Icon(
              Icons.local_library_rounded,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        label: "دعاء",
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            icon: Icon(
              Icons.home_filled,
            ),
          ),
        ),
        label: "الصفحة الرئيسية",
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/setting');
            },
            icon: Icon(Icons.settings),
          ),
        ),
        label: "الاعدادات",
      ),
    ],
  );
}
