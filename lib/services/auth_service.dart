import '../models/user_model.dart';

class AuthService {
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return 'Please enter your email and password.';
    }

    // TODO: Connect this to Firebase Authentication.
    return 'Login function will be connected to Firebase later.';
  }

  Future<String> registerUser({
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

    // TODO: Connect this to Firebase Authentication.
    return 'Register function will be connected to Firebase later.';
  }

  Future<String> saveStudentProfile({
    required UserModel user,
  }) async {
    // TODO: Save this user profile to Firestore.
    
    final userData = user.toMap();

return 'Student profile data prepared with ${userData.length} fields. Firebase saving will be connected later.';
}

  Future<String> resetPassword({
    required String email,
  }) async {
    if (email.isEmpty) {
      return 'Please enter your email address.';
    }

    // TODO: Connect this to Firebase password reset.
    return 'Password reset will be connected to Firebase later.';
  }

  Future<String> getUserRole({
    required String uid,
  }) async {
    // TODO: Get role from Firestore.
    // Possible roles: student or admin.
    return 'student';
  }

  Future<void> logoutUser() async {
    // TODO: Connect this to Firebase logout.
  }
}
