import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registerUser({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return 'Please fill out all fields.';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match.';
    }

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final uid = userCredential.user!.uid;

      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'fullName': fullName,
        'email': email,
        'school': '',
        'course': '',
        'yearLevel': '',
        'skills': [],
        'preferredLocation': '',
        'availability': '',
        'preferredJobType': '',
        'role': 'student',
        'isPremium': false,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Registration failed.';
    } catch (e) {
      return 'Something went wrong. Please try again.';
    }
  }

  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return 'Please enter your email and password.';
    }

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Login failed.';
    } catch (e) {
      return 'Something went wrong. Please try again.';
    }
  }

  Future<String?> resetPassword({
    required String email,
  }) async {
    if (email.isEmpty) {
      return 'Please enter your email address.';
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'Password reset failed.';
    } catch (e) {
      return 'Something went wrong. Please try again.';
    }
  }

  Future<String?> saveStudentProfile({
    required String school,
    required String course,
    required String yearLevel,
    required String skills,
    required String preferredLocation,
    required String availability,
    required String preferredJobType,
  }) async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      return 'No logged-in user found.';
    }

    if (school.isEmpty ||
        course.isEmpty ||
        yearLevel.isEmpty ||
        skills.isEmpty ||
        preferredLocation.isEmpty ||
        availability.isEmpty ||
        preferredJobType.isEmpty) {
      return 'Please complete all profile fields.';
    }

    try {
      final skillsList = skills
          .split(',')
          .map((skill) => skill.trim())
          .where((skill) => skill.isNotEmpty)
          .toList();

      await _firestore.collection('users').doc(currentUser.uid).update({
        'school': school,
        'course': course,
        'yearLevel': yearLevel,
        'skills': skillsList,
        'preferredLocation': preferredLocation,
        'availability': availability,
        'preferredJobType': preferredJobType,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return null;
    } catch (e) {
      return 'Failed to save profile. Please try again.';
    }
  }

  Future<String> getCurrentUserRole() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      return 'student';
    }

    final userDoc =
        await _firestore.collection('users').doc(currentUser.uid).get();

    if (!userDoc.exists) {
      return 'student';
    }

    final data = userDoc.data();

    return data?['role'] ?? 'student';
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
