import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/starterPage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Roboto'), home: StarterPage());
  }
}
