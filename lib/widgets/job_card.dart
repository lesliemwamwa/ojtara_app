import 'package:flutter/material.dart';
import '../models/job_model.dart';

class JobCard extends StatefulWidget {
  final JobModel job;
  final VoidCallback onTap;

  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        onTap: widget.onTap,

        title: Text(
          widget.job.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text(
          '${widget.job.company} • ${widget.job.location}',
        ),

        trailing: IconButton(
          icon: Icon(
            isSaved ? Icons.favorite : Icons.favorite_border,
            color: Colors.pink,
          ),
          onPressed: () {
            setState(() {
              isSaved = !isSaved;
            });
          },
        ),
      ),
    );
  }
}