import 'package:flutter/material.dart';

class ApplicationTrackerScreen extends StatelessWidget {
  const ApplicationTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final applications = [
      {
        'title': 'Senior Frontend Developer',
        'company': 'Figma',
        'status': 'Applied',
      },
      {
        'title': 'Sales Associate',
        'company': 'Ayala Malls',
        'status': 'For Review',
      },
      {
        'title': 'Math Tutor',
        'company': 'Bright Minds Tutorial Center',
        'status': 'Interview',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Tracker'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: applications.length,
        itemBuilder: (context, index) {
          final application = applications[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.track_changes, color: Colors.pinkAccent),
              title: Text(application['title']!),
              subtitle: Text(application['company']!),
              trailing: Chip(
                label: Text(application['status']!),
                backgroundColor: Colors.pink.shade50,
              ),
            ),
          );
        },
      ),
    );
  }
}