import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final schoolController = TextEditingController();
  final courseController = TextEditingController();
  final yearLevelController = TextEditingController();
  final skillsController = TextEditingController();
  final locationController = TextEditingController();
  final availabilityController = TextEditingController();
  final preferredTypeController = TextEditingController();

  void saveProfile() {
    final school = schoolController.text.trim();
    final course = courseController.text.trim();
    final yearLevel = yearLevelController.text.trim();
    final skills = skillsController.text.trim();
    final location = locationController.text.trim();
    final availability = availabilityController.text.trim();
    final preferredType = preferredTypeController.text.trim();

    if (school.isEmpty ||
        course.isEmpty ||
        yearLevel.isEmpty ||
        skills.isEmpty ||
        location.isEmpty ||
        availability.isEmpty ||
        preferredType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please complete all profile fields.'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved. Firebase saving will be added later.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FA),
      appBar: AppBar(
        title: const Text('Student Profile Setup'),
        backgroundColor: const Color(0xFFD85B6B),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                size: 80,
                color: Color(0xFFD85B6B),
              ),

              const SizedBox(height: 16),

              const Text(
                'Complete Your Profile',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263238),
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                'This helps OJTARA match you with suitable jobs and internships.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 32),

              TextField(
                controller: schoolController,
                decoration: const InputDecoration(
                  labelText: 'School',
                  prefixIcon: Icon(Icons.school_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  labelText: 'Course',
                  prefixIcon: Icon(Icons.menu_book_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: yearLevelController,
                decoration: const InputDecoration(
                  labelText: 'Year Level',
                  hintText: 'Example: 3rd Year',
                  prefixIcon: Icon(Icons.layers_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills',
                  hintText: 'Example: Canva, Encoding, Programming',
                  prefixIcon: Icon(Icons.star_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: 'Preferred Location',
                  hintText: 'Example: Cagayan de Oro',
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: availabilityController,
                decoration: const InputDecoration(
                  labelText: 'Availability',
                  hintText: 'Example: Weekend, Afternoon, Flexible',
                  prefixIcon: Icon(Icons.schedule_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: preferredTypeController,
                decoration: const InputDecoration(
                  labelText: 'Preferred Job Type',
                  hintText: 'Example: Internship, Part-time, Remote',
                  prefixIcon: Icon(Icons.work_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD85B6B),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Save Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
