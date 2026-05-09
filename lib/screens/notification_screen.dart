import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'New Job Match',
        'message': 'A new Senior Frontend Developer opportunity matches your profile.',
      },
      {
        'title': 'Application Update',
        'message': 'Your application is now under review.',
      },
      {
        'title': 'Interview Notice',
        'message': 'An interview schedule has been posted for one of your applications.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.pinkAccent),
              title: Text(notification['title']!),
              subtitle: Text(notification['message']!),
            ),
          );
        },
      ),
    );
  }
}