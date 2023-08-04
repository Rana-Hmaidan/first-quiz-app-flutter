import 'package:flutter/material.dart';
import 'package:quiz_app_first/pages/home_page.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}