import 'package:flutter/material.dart';
import 'package:flutter_task/module/news.dart';
import 'package:flutter_task/pages/SignIn.dart';
import 'package:flutter_task/pages/SignUp.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TheGorgeousLogin',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        primaryColor: Colors.brown[400],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.lightGreen,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(16)),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.all(16),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            labelStyle: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500)),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SignUp(),
        "/SignIn": (context) => SignIn(),
        "/home": (context) => Home(),
      },
    );
  }
}
