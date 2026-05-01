import 'package:flutter/material.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Projects",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: const [

              // 🛒 1. E-COMMERCE
              ProjectCard(
                title: "E-Commerce App (Shop App)",
                problem:
                    "Modern users expect a fast, seamless, and secure shopping experience across mobile platforms, but many apps fail to deliver smooth UX and real-time performance.",
                solution:
                    "Built a scalable production-ready e-commerce app using Flutter with Clean Architecture and Bloc, ensuring maintainability, performance, and smooth user experience.",
                features:
                    "Authentication (Google & Email)\nProduct catalog\nCart system with real-time updates\nCheckout flow\nOrder tracking\nResponsive UI across Android & iOS",
                tech:
                    "Flutter • Firebase • Bloc • REST API • Clean Architecture",
              ),

              // 📱 2. SOCIAL APP (MINIGRAM)
              ProjectCard(
                title: "Minigram (Social Media App)",
                problem:
                    "Users need a fast and interactive social platform with real-time updates and smooth engagement features.",
                solution:
                    "Developed a real-time social media application using Firebase and Flutter with Cubit state management for scalable performance.",
                features:
                    "Real-time posts\nLikes & comments\nUser profiles\nImage sharing\nLive updates using streams",
                tech:
                    "Flutter • Firebase • Cubit • Streams",
              ),

              // 📊 3. DASHBOARD
              ProjectCard(
                title: "Analytics Dashboard (Time Series App)",
                problem:
                    "Businesses need clear visualization of complex data to make informed decisions.",
                solution:
                    "Built a dynamic dashboard that transforms raw data into meaningful insights using interactive charts and clean UI design.",
                features:
                    "Time-series charts\nData visualization\nAPI integration\nInteractive analytics\nResponsive dashboard layout",
                tech:
                    "Flutter • Charts • REST API • State Management",
              ),

              // ✅ 4. TASKFLOW
              ProjectCard(
                title: "TaskFlow (Productivity App)",
                problem:
                    "Users struggle with organizing tasks efficiently across devices with offline support.",
                solution:
                    "Built an offline-first task management app using Hive and Clean Architecture for high performance and reliability.",
                features:
                    "Task creation & management\nOffline storage\nPriority system\nClean UI\nFast local database (Hive)",
                tech:
                    "Flutter • Hive • Clean Architecture • GetX",
              ),
            ],
          ),
        ],
      ),
    );
  }
}