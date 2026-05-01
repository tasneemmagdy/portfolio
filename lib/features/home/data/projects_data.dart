import '../model/project_model.dart';

class ProjectsData {
  static List<ProjectModel> list = [
    ProjectModel(
      title: "E-Commerce App (Shop App)",
      description: "Full shopping app with Firebase auth, cart & products.",
      tech: "Flutter • Firebase • Bloc",
      type: "E-Commerce",
    ),
    ProjectModel(
      title: "Minigram (Social App)",
      description: "Social app with posts, likes, comments, realtime updates.",
      tech: "Flutter • Firebase",
      type: "Social",
    ),
    ProjectModel(
      title: "Dashboard (Time Series App)",
      description: "Analytics dashboard with charts and data visualization.",
      tech: "Flutter • Charts • REST API",
      type: "Dashboard",
    ),
    ProjectModel(
      title: "TaskFlow",
      description: "Task management app with offline support.",
      tech: "Flutter • Hive • Clean Architecture",
      type: "Productivity",
    ),
  ];
}