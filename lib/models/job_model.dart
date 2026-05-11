class JobModel {
  final String title;
  final String company;
  final String location;
  final String type;
  final String description;
  final List<String> skills;

  JobModel({
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.description,
    required this.skills,
  });
}