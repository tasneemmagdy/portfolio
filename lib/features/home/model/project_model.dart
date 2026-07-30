class ProjectModel {
  final String title;
  final String description;

  final String problem;
  final String solution;

  final List<String> features;
  final List<String> technologies;

  final List<String> images;

  final String github;
  final String? demo;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.problem,
    required this.solution,
    required this.features,
    required this.technologies,
    required this.images,
    required this.github,
    this.demo,
  });
}