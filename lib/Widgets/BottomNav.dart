import 'package:flutter/material.dart';

class BNavigator extends StatefulWidget {
  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_ios), label: 'back'),
        BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.more_vert_rounded), label: 'more')
      ],
      fixedColor: Colors.teal,
    );
  }
}
