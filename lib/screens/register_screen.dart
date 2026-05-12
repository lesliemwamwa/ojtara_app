import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import 'profile_setup_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  Future<void> registerUser() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    setState(() {
      isLoading = true;
    });

    final errorMessage = await authService.registerUser(
      fullName: fullName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });

    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileSetupScreen(),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FA),
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: const Color(0xFFD85B6B),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Icon(
                  Icons.person_add_alt_1_rounded,
                  size: 75,
                  color: Color(0xFFD85B6B),
                ),

                const SizedBox(height: 16),

                const Text(
                  'Register to OJTARA',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263238),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Create your student account',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 32),

                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

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
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
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

                const SizedBox(height: 16),

                TextField(
                  controller: confirmPasswordController,
                  obscureText: !isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible =
                              !isConfirmPasswordVisible;
                        });
                      },
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD85B6B),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      isLoading ? 'Creating Account...' : 'Register',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
