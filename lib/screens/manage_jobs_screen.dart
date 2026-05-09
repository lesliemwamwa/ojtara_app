import 'package:flutter/material.dart';

class ManageJobsScreen extends StatelessWidget {
  const ManageJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jobs = [
      {
        'title': 'Senior Frontend Developer',
        'company': 'Figma',
        'location': 'Cagayan de Oro City',
      },
      {
        'title': 'Sales Associate',
        'company': 'Ayala Malls',
        'location': 'Cagayan de Oro City',
      },
      {
        'title': 'Math Tutor',
        'company': 'Bright Minds Tutorial Center',
        'location': 'Cagayan de Oro City',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Jobs'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.work, color: Colors.pinkAccent),
              title: Text(job['title']!),
              subtitle: Text('${job['company']} • ${job['location']}'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$value selected')),
                  );
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(value: 'Edit', child: Text('Edit')),
                  PopupMenuItem(value: 'Delete', child: Text('Delete')),
                  PopupMenuItem(value: 'View Details', child: Text('View Details')),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}