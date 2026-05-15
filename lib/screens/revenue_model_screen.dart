import 'package:flutter/material.dart';

class RevenueModelScreen extends StatelessWidget {
  const RevenueModelScreen({super.key});

  Widget revenueCard({
    required String title,
    required IconData icon,
    required List<String> items,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.pinkAccent, size: 34),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...items.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '• $item',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
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
      backgroundColor: const Color(0xFFFDF7FA),
      appBar: AppBar(
        title: const Text('Revenue Model'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          revenueCard(
            title: 'Featured Employer Posts',
            icon: Icons.campaign,
            items: const [
              'Employers may pay to feature job or internship posts.',
              'Featured posts appear higher in job listings.',
              'This gives employers better visibility to students.',
            ],
          ),
          revenueCard(
            title: 'Premium Student Features',
            icon: Icons.workspace_premium,
            items: const [
              'Resume Templates',
              'Priority Candidate Visibility',
              'Advanced Applicant Insights',
              'Premium users may appear as ⭐ Priority Candidate.',
              'Premium users may view profile views, status timeline, and applicant count.',
            ],
          ),
          revenueCard(
            title: 'School Partnership Subscription',
            icon: Icons.school,
            items: const [
              'Schools may subscribe for internship monitoring.',
              'Includes student tracking and employer coordination.',
              'Supports reporting and management of student applications.',
            ],
          ),
        ],
      ),
    );
  }
}