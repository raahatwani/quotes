import 'package:flutter/material.dart';

import '../MainApp.dart';
import 'constants.dart';

class container extends StatelessWidget {
  String containerText;
  container({required this.containerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: kboxdecorattion,
      width: screen.width * 0.3,
      height: screen.height * 0.3,
      child: Card(
        child: Center(
            child: Text(
          containerText,
          textScaleFactor: screen.width * 0.002,
        )),
      ),
    );
  }
}
