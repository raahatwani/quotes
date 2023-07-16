import 'package:flutter/material.dart';
import 'package:quotes/Widgets/constants.dart';
import 'MainApp.dart';
import 'api.dart';
import 'package:flutter/services.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(
              text: dataOne[0]['q'],
            ));
          },
          child: Icon(Icons.copy_sharp),
        ),
        appBar: AppBar(
          title: Text(
            '" QUOTE OF THE DAY',
            textScaleFactor: screen.width * 0.002,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height: screen.height * 1,
          width: screen.width * 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: kboxdecorattion,
                width: screen.width * 0.4,
                height: screen.height * 0.4,
                child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        dataOne[0]['q'],
                        textScaleFactor: screen.width * 0.002,
                      ),
                      Text(
                        dataOne[0]['a'],
                        textScaleFactor: screen.width * 0.002,
                      )
                    ])),
              ),
              OutlinedButton(
                  onPressed: () async {
                    var temp = await Clipboard.getData("text/plain");
                    print(temp?.text);
                  },
                  child: Text(
                    'check if copied',
                    textScaleFactor: screen.width * 0.002,
                  )),
            ],
          ),
        ));
  }
}

//PAGE 2

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(
              text: dataOne[0]['q'],
            ));
          },
          child: Icon(Icons.copy_sharp),
        ),
        appBar: AppBar(
          title: Text(
            '" RANDOM QUOTE',
            textScaleFactor: screen.width * 0.002,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          height: screen.height * 1,
          width: screen.width * 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: kboxdecorattion,
                width: screen.width * 0.4,
                height: screen.height * 0.4,
                child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        dataTwo[0]['q'],
                        textScaleFactor: screen.width * 0.002,
                      ),
                      Text(
                        dataTwo[0]['a'],
                        textScaleFactor: screen.width * 0.002,
                      )
                    ])),
              ),
              OutlinedButton(
                  onPressed: () async {
                    var temp = await Clipboard.getData("text/plain");
                    print(temp?.text);
                  },
                  child: Text(
                    'check if copied',
                    textScaleFactor: screen.width * 0.002,
                  )),
            ],
          ),
        ));
  }
}

//page3
class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '" WRITE A QUOTE',
          textScaleFactor: screen.width * 0.002,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: TextField(
        decoration: InputDecoration(hintText: 'Enter your quote!'),
      ),
    );
  }
}
