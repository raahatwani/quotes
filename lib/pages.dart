// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainApp.dart';
import 'api.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Clipboard.setData(ClipboardData(
        //       text: dataOne[0]['q'],
        //     ));
        //   },
        //   child: Icon(Icons.copy_sharp),
        // ),
        appBar: AppBar(
          title: Text(
            '" QUOTE OF THE DAY',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                width: screen.width * 0.6,
                height: screen.height * 0.3,
                child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataOne[0]['q'],
                          textScaleFactor: screen.width * 0.002,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataOne[0]['a'],
                          textScaleFactor: screen.width * 0.002,
                        ),
                      )
                    ])),
              ),
              // OutlinedButton(
              //     onPressed: () async {
              //       var temp = await Clipboard.getData("text/plain");
              //       print(temp?.text);
              //     },
              //     child: Text(
              //       'check if copied',
              //       textScaleFactor: screen.width * 0.002,
              //     )),
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Clipboard.setData(ClipboardData(
        //       text: dataOne[0]['q'],
        //     ));
        //   },
        //   child: Icon(Icons.copy_sharp),
        // ),
        appBar: AppBar(
          title: Text(
            '" RANDOM QUOTE',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                width: screen.width * 0.6,
                height: screen.height * 0.3,
                child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataTwo[0]['q'],
                          textScaleFactor: screen.width * 0.002,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dataTwo[0]['a'],
                          textScaleFactor: screen.width * 0.002,
                        ),
                      )
                    ])),
              ),
              // OutlinedButton(
              //     onPressed: () async {
              //       var temp = await Clipboard.getData("text/plain");
              //       print(temp?.text);
              //     },
              //     child: Text(
              //       'check if copied',
              //       textScaleFactor: screen.width * 0.002,
              //     )),
            ],
          ),
        ));
  }
}

//page3
class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '" IMAGE QUOTE',
            style: TextStyle(fontWeight: FontWeight.bold),
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
                // Text('image quote page'),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.network(urlThree),
                ),
              ],
            )));
  }
}

//page4
class PageFour extends StatefulWidget {
  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  List<String> savedQuotes = [];
  @override
  void initState() {
    super.initState();
    getSavedQuotes();
  }

  void getSavedQuotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? quotes = prefs.getStringList('quotes');
    if (quotes != null) {
      setState(() {
        savedQuotes = quotes;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '" YOUR QUOTES',
            style: TextStyle(fontWeight: FontWeight.bold),
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
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: ListView.builder(
                      itemCount: savedQuotes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
                          child: Card(
                            child: ListTile(
                              title: Text(savedQuotes[index]),
                              trailing: Row(mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(onPressed: editQuote(savedQuotes[index]), icon: Icon(Icons.edit)),
                                  IconButton(icon: Icon(Icons.delete), onPressed: () {
                                    deleteQuote(savedQuotes[index]);
                                    },),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      physics: AlwaysScrollableScrollPhysics()),
                )
              ],
            )));
  }
   editQuote(String quoteToEdit){
//-------------------------------------------------------------------------------------------------------------------------------
  }
  void deleteQuote(String quoteToDelete)async{
SharedPreferences prefs=await SharedPreferences.getInstance();
List<String>? quotes = prefs.getStringList('quotes');
if(quotes!=null){
  quotes.remove(quoteToDelete);
  await prefs.setStringList('quotes', quotes);
  setState(() {
    savedQuotes=quotes;
  });
}

  }
}
