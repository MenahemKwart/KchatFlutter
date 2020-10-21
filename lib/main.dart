import 'package:Kchat/screens/authenticate/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp().whenComplete(() => print('Firebase Initialized'));
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.blue,
            primaryColorLight: Colors.blue[200],
            primaryColorDark: Colors.blue[900],
            backgroundColor: Colors.blue[200],
            accentColor: Colors.pink[800],
            splashColor: Colors.white,
            hoverColor: Colors.white,
            scaffoldBackgroundColor: Colors.blue[400]),
        home: SignInPage());
  }
}
