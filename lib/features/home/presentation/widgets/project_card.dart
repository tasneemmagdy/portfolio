import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String problem;
  final String solution;
  final String features;
  final String tech;

  const ProjectCard({
    super.key,
    required this.title,
    required this.problem,
    required this.solution,
    required this.features,
    required this.tech,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff16213E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff22304F)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),

          const SizedBox(height: 12),

          _section("Problem", problem, Colors.redAccent),
          _section("Solution", solution, Colors.greenAccent),
          _section("Features", features, Colors.blueAccent),

          const SizedBox(height: 10),

          Text(
            "Tech: $tech",
            style: const TextStyle(color: Colors.orangeAccent),
          ),
        ],
      ),
    );
  }

  Widget _section(String title, String text, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        Text(text, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 8),
      ],
    );
  }
}