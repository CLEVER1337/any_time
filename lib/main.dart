import 'package:any_time/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:any_time/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = 'Coffee Any Time';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
      },
    );
  }
}
