import 'package:flutter/material.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/launcher_helper.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hi, I'm Tasneem ",
            style: AppTextStyles.heading1,
          ),

          const SizedBox(height: 10),

          const Text(
            "Flutter Mobile Developer | Software Engineer",
            style: AppTextStyles.heading2,
          ),

          const SizedBox(height: 20),

          const Text(
            "Flutter Mobile Developer with 2+ years of experience building scalable cross-platform applications for Android and iOS. Delivered multiple production-ready apps including e-commerce, social media, dashboards, and productivity tools.",
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 12),

          const Text(
            "I focus on building real-world apps with clean architecture, high performance, and smooth user experience using Flutter, Firebase, REST APIs, and modern state management solutions like BLoC, Cubit, Provider, and GetX.",
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 12),

          const Text(
            "Experience also includes 2 years as a Teaching Assistant at Pharos University, strengthening my communication, mentoring, and technical leadership skills.",
            style: AppTextStyles.body,
          ),

          const SizedBox(height: 25),

          Wrap(
            spacing: 10,
            children: [
              _btn("GitHub", () => LauncherHelper.open(AppLinks.github)),
              _btn("LinkedIn", () => LauncherHelper.open(AppLinks.linkedin)),
              _btn("Email", () => LauncherHelper.open(AppLinks.email)),
              _btn("View CV", () => LauncherHelper.open(AppLinks.cv)),
            ],
          ),

          const SizedBox(height: 30),

          // 🔥 NEW: IMPACT STATS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _Stat("4+", "Projects"),
              _Stat("2+", "Years Experience"),
              _Stat("Production", "Ready Apps"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _btn(String text, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff4F8CFF),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text),
    );
  }
}

// 🔥 STAT WIDGET
class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white54),
        ),
      ],
    );
  }
}