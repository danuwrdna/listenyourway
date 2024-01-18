import 'package:flutter/material.dart';
import 'package:listenyourway/view/page/HomePage.dart';
import 'package:listenyourway/view/page/LoginPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
