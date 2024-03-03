// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, file_names, non_constant_identifier_names, must_be_immutable, deprecated_member_use, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:quotes/pages.dart';
import 'package:share_plus/share_plus.dart';
import 'Widgets/Drawer.dart';
import 'api.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController QuoteController = TextEditingController();
var screen;

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return QuotesDialog();
            },
          );
          // Navigator.push(context, MaterialPageRoute(builder: (_) {
          //   return
          //   PageThree();
          // }));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      // appbar
      appBar: AppBar(
        title: Text(
          '" QUOTES',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          textScaleFactor: screen.width * 0.002,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            color: Colors.black,
            onPressed: () {
              Share.share('com.example.quotes');
            },
          )
        ],
        backgroundColor: Colors.blue,
      ),
      // bottomNavigationBar: BNavigator(),

      //background
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome !',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    textScaleFactor: screen.width * 0.006,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: screen.height * 0.05,
                      width: screen.width * 0.4,
                      child: CustomButton(
                        text: "Quote of the Day",
                        onPressed: () async {
                          await getOne();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return PageOne();
                          }));
                        },
                      )),
                  SizedBox(
                      height: screen.height * 0.05,
                      width: screen.width * 0.4,
                      child: CustomButton(
                        text: "Random Quote",
                        onPressed: () async {
                          await getTwo();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return PageTwo();
                          }));
                        },
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: screen.height * 0.05,
                      width: screen.width * 0.4,
                      child: CustomButton(
                        text: 'Image Quote',
                        onPressed: () async {
                          await getThree();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return PageThree();
                          }));
                        },
                      )),
                  SizedBox(
                      height: screen.height * 0.05,
                      width: screen.width * 0.4,
                      child: CustomButton(
                          text: 'Your Quotes',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return PageFour();
                            }));
                          }))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

final formGlobalKey = GlobalKey<FormState>();

class QuotesDialog extends StatelessWidget {
  const QuotesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        'What\'s on your mind !',
      ),
      content: Form(
        key: formGlobalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Type your quote here:',
            ),
            TextFormField(
              controller: QuoteController,
              decoration: InputDecoration(hintText: 'Your quote...'),
            ),
            SizedBox(height: 16),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))) ),
              onPressed: () {
                saveQuote(QuoteController.text);
                QuoteController.clear();
                Navigator.of(context).pop();
              },
              child: Text('Save',style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
  void saveQuote(String quote)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    List<String>? quotes=prefs.getStringList('quotes');
    if(quotes==null){
      quotes=[];
    }
    quotes.add(quote);
    prefs.setStringList('quotes', quotes);
  }
}

class CustomButton extends StatelessWidget {
  String text;
  final VoidCallback onPressed;
  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStatePropertyAll(Colors.white70)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ));
  }
}
