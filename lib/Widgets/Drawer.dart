// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

import '../MainApp.dart';
import '../api.dart';
import '../pages.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(width: MediaQuery.of(context).size.width*0.6,
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(height: MediaQuery.of(context).size.height*0.15,
            child: DrawerHeader( 
              child: Icon(
                Icons.format_quote_sharp,
                size: screen.width * 0.1,
                color: Colors.black,
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
          CustomTile(icon:  Icons.timer, onTap: () async {
              await getOne();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PageOne();
              }));
            }, text: 'Quote of the Day'),
         CustomTile(icon: Icons.timeline_rounded, onTap: () async {
              await getTwo();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PageTwo();
              }));
            }, text: 'Random Quote'),
            CustomTile(icon: Icons.image, onTap: () async {
              await getThree();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PageThree();
              }));
            }, text: 'Image Quote'),
            CustomTile(icon: Icons.note, onTap: 
            () async {
              await getTwo();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PageFour();
              }
              ));
            }, text: 'Your Quotes'),
        ],
      ),
    );
  }
}


class CustomTile extends StatelessWidget {
  final VoidCallback onTap;
  String text;
  IconData icon;
 CustomTile({
    required this.icon,
    required this.onTap,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
            onTap:onTap,
            leading: Icon(
              icon,
              size: screen.width * 0.05,
              color: Colors.black,
            ),
            title: Text(
              text,
              textScaleFactor: screen.width * 0.0020,
              style: TextStyle(color: Colors.black),
            ),
          );
  }
}