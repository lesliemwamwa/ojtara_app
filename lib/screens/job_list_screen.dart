import 'package:flutter/material.dart';
import '../models/job_model.dart';
import '../widgets/job_card.dart';
import 'job_details_screen.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<JobModel> jobs = [
    JobModel(
      title: "Flutter Developer",
      company: "Tech Corp",
      location: "Remote",
      type: "Full-time",
      description: "Build mobile apps using Flutter",
      skills: ["Flutter", "Dart"],
    ),
    JobModel(
      title: "Web Developer",
      company: "Web Inc",
      location: "Cagayan de Oro",
      type: "Part-time",
      description: "Build responsive websites",
      skills: ["HTML", "CSS", "JS"],
    ),
  ];

  String searchText = "";
  String selectedLocation = "All";
  String selectedType = "All";

  @override
  Widget build(BuildContext context) {
    List<JobModel> filteredJobs = jobs.where((job) {
      final matchesSearch =
          job.title.toLowerCase().contains(searchText.toLowerCase()) ||
              job.company.toLowerCase().contains(searchText.toLowerCase());

      final matchesLocation =
          selectedLocation == "All" || job.location == selectedLocation;

      final matchesType =
          selectedType == "All" || job.type == selectedType;

      return matchesSearch && matchesLocation && matchesType;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Listings"),
      ),
      body: Column(
        children: [
          // SEARCH
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search jobs...",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          // FILTERS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedLocation,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                          value: "All", child: Text("All Locations")),
                      DropdownMenuItem(
                          value: "Remote", child: Text("Remote")),
                      DropdownMenuItem(
                          value: "Cagayan de Oro", child: Text("CDO")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedType,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                          value: "All", child: Text("All Types")),
                      DropdownMenuItem(
                          value: "Full-time", child: Text("Full-time")),
                      DropdownMenuItem(
                          value: "Part-time", child: Text("Part-time")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // LIST OR EMPTY STATE
          Expanded(
            child: filteredJobs.isEmpty
                ? const Center(
                    child: Text(
                      "No jobs found 😢",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredJobs.length,
                    itemBuilder: (context, index) {
                      return JobCard(
                        job: filteredJobs[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JobDetailsScreen(
                                job: filteredJobs[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}