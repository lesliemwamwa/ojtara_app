import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'admin_dashboard_screen.dart';
import 'forgot_password_screen.dart';
import 'job_list_screen.dart';
import 'register_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

final AuthService authService = AuthService();
bool isLoading = false;

  bool isPasswordVisible = false;

  Future<void> loginUser() async {
  final email = emailController.text.trim();
  final password = passwordController.text.trim();

  setState(() {
    isLoading = true;
  });

  final errorMessage = await authService.loginUser(
    email: email,
    password: password,
  );

  if (!mounted) return;

  if (errorMessage != null) {
    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
    return;
  }

  final role = await authService.getCurrentUserRole();

  if (!mounted) return;

  setState(() {
    isLoading = false;
  });

  if (role == 'admin') {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AdminDashboardScreen(),
      ),
    );
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const JobListScreen(),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.work_rounded,
                  size: 80,
                  color: Color(0xFFD85B6B),
                ),

                const SizedBox(height: 16),

                const Text(
                  'OJTARA',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263238),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Tara, Apply Na!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
  controller: passwordController,
  obscureText: !isPasswordVisible,
  decoration: InputDecoration(
    labelText: 'Password',
    prefixIcon: const Icon(Icons.lock_outline),
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
    ),
    border: const OutlineInputBorder(),
  ),
),

Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      );
    },
    child: const Text('Forgot Password?'),
  ),
),


                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : loginUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD85B6B),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
  isLoading ? 'Logging in...' : 'Login',
  style: const TextStyle(fontSize: 16),
),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const RegisterScreen(),
    ),
  );
},
                  child: const Text("Don't have an account? Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
