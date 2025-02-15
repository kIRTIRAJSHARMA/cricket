import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAHDxfif5peLfyvwkaWj7wxP4bfE5uVWVs",
      appId: "1:834467776276:android:1e644f75fc4f90cbe36401",
      messagingSenderId: "834467776276",
      projectId: "cricket-ca4d5",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cricket Live Score',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const LoginScreen(),
      routes: {
        "/signup": (context) => const SignupScreen(), // Fixed Naming
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}
