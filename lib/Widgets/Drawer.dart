import 'package:flutter/material.dart';

import '../MainApp.dart';
import '../api.dart';
import '../pages.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Icon(
              Icons.format_quote_sharp,
              size: screen.width * 0.1,
              color: Colors.white,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Padding(padding: EdgeInsets.only(bottom: 200)),
          ListTile(
            onTap: () async {
              await getOne();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PageOne();
              }));
            },
            tileColor: Colors.blue,
            leading: Icon(
              Icons.timer,
              size: screen.width * 0.05,
              color: Colors.white,
            ),
            title: Text(
              'QUOTE OF THE DAY',
              textScaleFactor: screen.width * 0.0015,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 200)),
          ListTile(
            onTap: () async {
              await getTwo();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PageTwo();
              }));
            },
            tileColor: Colors.blue,
            leading: Icon(
              Icons.timeline_rounded,
              size: screen.width * 0.05,
              color: Colors.white,
            ),
            title: Text(
              'RANDOM QUOTE',
              textScaleFactor: screen.width * 0.0015,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
