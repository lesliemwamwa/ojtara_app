class UserModel {
  final String uid;
  final String fullName;
  final String email;
  final String school;
  final String course;
  final String yearLevel;
  final List<String> skills;
  final String preferredLocation;
  final String availability;
  final String preferredJobType;
  final String role;
  final bool isPremium;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.school,
    required this.course,
    required this.yearLevel,
    required this.skills,
    required this.preferredLocation,
    required this.availability,
    required this.preferredJobType,
    this.role = 'student',
    this.isPremium = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'school': school,
      'course': course,
      'yearLevel': yearLevel,
      'skills': skills,
      'preferredLocation': preferredLocation,
      'availability': availability,
      'preferredJobType': preferredJobType,
      'role': role,
      'isPremium': isPremium,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      school: map['school'] ?? '',
      course: map['course'] ?? '',
      yearLevel: map['yearLevel'] ?? '',
      skills: List<String>.from(map['skills'] ?? []),
      preferredLocation: map['preferredLocation'] ?? '',
      availability: map['availability'] ?? '',
      preferredJobType: map['preferredJobType'] ?? '',
      role: map['role'] ?? 'student',
      isPremium: map['isPremium'] ?? false,
    );
  }
}
