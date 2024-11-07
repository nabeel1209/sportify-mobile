import 'package:flutter/material.dart';
import 'package:sportify_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3C844B), 
          secondary: const Color.fromARGB(255, 18,18,18)
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}