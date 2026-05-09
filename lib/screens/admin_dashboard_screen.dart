import 'package:flutter/material.dart';

import 'add_job_screen.dart';
import 'manage_jobs_screen.dart';
import 'saved_jobs_screen.dart';
import 'application_tracker_screen.dart';
import 'notification_screen.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  void openScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Widget dashboardCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget screen,
  }) {
    return InkWell(
      onTap: () => openScreen(context, screen),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: Colors.pinkAccent),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OJTARA Admin Dashboard'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            dashboardCard(
              context,
              title: 'Add Job',
              icon: Icons.add_business,
              screen: const AddJobScreen(),
            ),
            dashboardCard(
              context,
              title: 'Manage Jobs',
              icon: Icons.work,
              screen: const ManageJobsScreen(),
            ),
            dashboardCard(
              context,
              title: 'Saved Jobs',
              icon: Icons.bookmark,
              screen: const SavedJobsScreen(),
            ),
            dashboardCard(
              context,
              title: 'Application Tracker',
              icon: Icons.track_changes,
              screen: const ApplicationTrackerScreen(),
            ),
            dashboardCard(
              context,
              title: 'Notifications',
              icon: Icons.notifications,
              screen: const NotificationScreen(),
            ),
          ],
        ),
      ),
    );
  }
}