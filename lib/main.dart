import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Import SplashScreen
import 'screens/auth_screen.dart'; // Import AuthScreen
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bobusku',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Tema aplikasi
      ),
      home: SplashScreen(), // Tetapkan SplashScreen sebagai halaman pertama
    );
  }
}
