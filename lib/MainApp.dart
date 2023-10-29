// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quotes/pages.dart';
import 'package:share_plus/share_plus.dart';
import 'Widgets/Drawer.dart';
import 'api.dart';
TextEditingController QuoteController = TextEditingController();
var screen;

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MainDrawer(),
      floatingActionButton: FloatingActionButton(
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
        child: Icon(Icons.add,color: Colors.white70,),
        
      ),
      // appbar
      appBar: AppBar(
        title: Text(
          '" QUOTES',style: TextStyle(color: Colors.white70),
          textScaleFactor: screen.width * 0.002,
        
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined),
            color: Colors.white70,
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
                    'Welcome !',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
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
                    height: screen.height*0.05,
                    width: screen.width*0.4,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white70)),
                        onPressed: () async {
                          await getOne();
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return PageOne();
                          }));
                        },
                        child: Text(
                          'QUOTE OF THE DAY',
                          style: TextStyle(color: Colors.lightBlue),
                        )),
                  ),
                  SizedBox(
                     height: screen.height*0.05,
                    width: screen.width*0.4,
                    child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white70)),
                        onPressed: () async {
                          await getTwo();
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return PageTwo();
                          }));
                        },
                        child: Text('RANDOM QUOTE',style: TextStyle(color: Colors.lightBlueAccent),)),
                  ),
               
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    SizedBox(
                       height: screen.height*0.05,
                    width: screen.width*0.4,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white70)),
                        onPressed: () 
                        // {
                        //   Navigator.push(context, MaterialPageRoute(builder: (_){
                        //     return PageThree();
                        //   }));
                        // },
                        async {
                          await getThree();
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return PageThree();
                          }));
                        },
                        child: Text('IMAGE QUOTE',style: TextStyle(color: Colors.lightBlueAccent),)),
                    ),
                 SizedBox(
                   height: screen.height*0.05,
                    width: screen.width*0.4,
                   child: OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white70)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_){
                            return PageFour();
                          }));
                        },
                        // async {
                        //   await getTwo();
                        //   Navigator.push(context, MaterialPageRoute(builder: (_) {
                        //     return PageTwo();
                        //   }));
                        // },
                        child: Text('YOUR QUOTES',style: TextStyle(color: Colors.lightBlueAccent),)),
                 )
                
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
      title: Text('What\'s on your mind !',),
      content: Form(
        key: formGlobalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Type your quote here:',
              ),
            TextFormField(
              controller: QuoteController,
              decoration: InputDecoration(hintText: 'Your quote...'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              // async {
              //   if (formGlobalKey.currentState!.validate()) {
              //     String feedbackId =
              //         DateTime.now().microsecondsSinceEpoch.toString();
              //     await FirebaseFirestore.instance
              //         .collection('feedback')
              //         .doc(feedbackId)
              //         .set({
              //       'FID': feedbackId,
              //       'FeedBack': feedbackcontroller.text,
              //     }).then((_) {
              //       feedbackcontroller.clear();
              //       Navigator.of(context).pop();
              //       _showThankYouDialog(context);
              //     });
              //   }
              // },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
  