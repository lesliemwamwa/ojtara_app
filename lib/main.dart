import 'package:flutter/material.dart';
import 'screens/admin_dashboard_screen.dart';

void main() {
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
      home: const AdminDashboardScreen(),
    );
  }
}