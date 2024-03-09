import 'package:flutter/material.dart';
import 'package:recipbook/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recip Book",
      home: LoginPage(),
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade900),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}