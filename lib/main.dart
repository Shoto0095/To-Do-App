import 'package:flutter/material.dart';
import 'package:learn/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To do app',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
