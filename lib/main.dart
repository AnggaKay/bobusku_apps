import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bobusku',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SplashScreen(), // Ganti dengan SplashScreen sebagai halaman pertama
    );
  }
}
