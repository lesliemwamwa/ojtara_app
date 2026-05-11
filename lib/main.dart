import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const OjtaraApp());
}

class OjtaraApp extends StatelessWidget {
  const OjtaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OJTARA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: const Color(0xFFFDF7FA),
      ),
      home: const LoginScreen(),
    );
  }
}