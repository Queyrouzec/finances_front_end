import 'package:finances_front_end/basic_spreadsheet/basic_spreadsheet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finances',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Scaffold(
        body: SpreadSheetPage(),
      ),
    );
  }
}
