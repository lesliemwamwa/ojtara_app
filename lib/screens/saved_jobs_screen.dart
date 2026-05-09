import 'package:flutter/material.dart';

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedJobs = [
      {
        'title': 'Senior Frontend Developer',
        'company': 'Figma',
        'status': 'Saved',
      },
      {
        'title': 'Math Tutor',
        'company': 'Bright Minds Tutorial Center',
        'status': 'Saved',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Jobs'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: savedJobs.length,
        itemBuilder: (context, index) {
          final job = savedJobs[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.bookmark, color: Colors.pinkAccent),
              title: Text(job['title']!),
              subtitle: Text(job['company']!),
              trailing: Chip(
                label: Text(job['status']!),
                backgroundColor: Colors.pink.shade50,
              ),
            ),
          );
        },
      ),
    );
  }
}