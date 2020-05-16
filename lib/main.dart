import 'package:fiveminutegeneral_web_app/helpers/authenticate.dart';
import 'package:fiveminutegeneral_web_app/views/home.dart';
import 'package:flutter/material.dart';

import 'helpers/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;
  ///https://www.amazon.com/Five-Minute-Journal-Happier-Minutes/dp/0991846206

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await Constants.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiveMinuteJournal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'OverpassRegular',
        primaryColor: Color(0xff016FB9),
      ),
      home: userIsLoggedIn != null
          ? userIsLoggedIn ? Home() : Authenticate()
          : Container(),
    );
  }
}
