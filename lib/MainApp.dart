import 'package:flutter/material.dart';
import 'package:quotes/pages.dart';
import 'package:share_plus/share_plus.dart';
import 'Widgets/BottomNav.dart';
import 'Widgets/Drawer.dart';
import 'Widgets/container.dart';
import 'api.dart';

var screen;

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return PageThree();
          }));
        },
        child: Icon(Icons.add),
      ),
      // appbar
      appBar: AppBar(
        title: Text(
          '" QUOTES',
          textScaleFactor: screen.width * 0.002,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            onPressed: () {
              Share.share('com.example.quotes');
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BNavigator(),

      //background
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
            child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //containers
              GestureDetector(
                onTap: () async {
                  await getOne();
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PageOne();
                  }));
                },
                child: container(containerText: 'QUOTE OF THE DAY'),
              ),
              Padding(padding: EdgeInsets.all(30)),
              GestureDetector(
                onTap: () async {
                  await getTwo();
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PageTwo();
                  }));
                },
                child: container(containerText: 'RANDOM QUOTE'),
              )
            ],
          ),
        )),
      ),
    );
  }
}
