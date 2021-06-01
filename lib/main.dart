import 'package:flutter/material.dart';
import './loginPage.dart' as loginPage;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Formulaire en Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: loginPage.LoginPage());
  }
}
