import 'package:flutter/material.dart';

class AddJobScreen extends StatelessWidget {
  const AddJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobTitleController = TextEditingController();
    final companyController = TextEditingController();
    final locationController = TextEditingController();
    final skillController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Job / Internship'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: jobTitleController,
              decoration: const InputDecoration(
                labelText: 'Job Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: companyController,
              decoration: const InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: skillController,
              decoration: const InputDecoration(
                labelText: 'Required Skill',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Job Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Job post added successfully.'),
                  ),
                );
              },
              child: const Text(
                'Post Job',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}