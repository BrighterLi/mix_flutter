import 'package:flutter/material.dart';
import 'package:mix_flutter/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mix flutter',
      theme: ThemeData(),
      home: Router(),
    );
  }
}

