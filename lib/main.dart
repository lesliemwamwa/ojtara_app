import 'package:flutter/material.dart';
 member2-job-module
import 'screens/admin_dashboard_screen.dart';
import 'screens/job_list_screen.dart';

import 'screens/login_screen.dart';

 main

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
 member2-job-module
      home: const JobListScreen(),

      home: const LoginScreen(),
main
    );
  }
} 