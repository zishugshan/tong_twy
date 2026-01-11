import 'package:flutter/material.dart';
import 'package:tong_twy/views/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tongue Twister Game',
      home: const StartPage(),
    );
  }
}
