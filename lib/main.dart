import 'package:flutter/material.dart';
import '../gridViewScreen/gridViewScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridViewScreen(),
    );
  }
}
