import 'package:flutter/material.dart';
import '../../../../core/constants/app_text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Skills",
                style: AppTextStyles.heading2,
              ),

              const SizedBox(height: 20),

              // ================= TECHNICAL =================
              const Text(
                "Technical Skills",
                style: AppTextStyles.heading2,
              ),

              const SizedBox(height: 10),

              const Text(
                "Flutter & Dart (2+ years) | Clean Architecture | State Management (BLoC, Cubit, Provider, GetX) | Firebase (Auth, Firestore, Storage, Cloud Functions) | RESTful APIs & Dio | Real-time Streams | Push Notifications | Localization | Git & GitHub | CI/CD (GitHub Actions) | Google Play Store Deployment | Android & iOS Development | Hive Local Database | Java | Python | HTML | CSS | SQL | OOP | Unit Testing",
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 25),

              // ================= SOFT SKILLS =================
              const Text(
                "Soft Skills",
                style: AppTextStyles.heading2,
              ),

              const SizedBox(height: 10),

              const Text(
                "Collaboration | Problem-solving | Communication | Time Management | Adaptability | Attention to detail | Mentoring",
                style: AppTextStyles.body,
              ),

              const SizedBox(height: 25),

              // ================= ADDITIONAL =================
              const Text(
                "Additional Skills",
                style: AppTextStyles.heading2,
              ),

              const SizedBox(height: 10),

              const Text(
                "Public Speaking | Writing | Research | Teamwork | Analytical Thinking | Documentation",
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}