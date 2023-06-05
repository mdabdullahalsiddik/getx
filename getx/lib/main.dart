import 'package:flutter/material.dart';
import 'package:getx/page/home.dart';
import 'package:getx/static/all_color.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: AllColor.orangecolor),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
