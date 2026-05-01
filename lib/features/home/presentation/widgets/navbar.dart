import 'package:flutter/material.dart';
import 'package:portfolio_web/features/home/presentation/pages/home_page.dart';
import '../../../../core/constants/app_colors.dart';

class Navbar extends StatelessWidget {
  final Section active;
  final VoidCallback onHome;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const Navbar({
    super.key,
    required this.active,
    required this.onHome,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  Widget item(String text, Section section, VoidCallback onTap) {
    final isActive = active == section;

    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? AppColors.primary : Colors.white70,
          fontWeight:
              isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black.withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Tasneem.dev",
              style: TextStyle(color: Colors.white)),
          Row(
            children: [
              item("Home", Section.home, onHome),
              item("Skills", Section.skills, onSkills),
              item("Projects", Section.projects, onProjects),
              item("Contact", Section.contact, onContact),
            ],
          )
        ],
      ),
    );
  }
}