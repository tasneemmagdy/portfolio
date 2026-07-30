import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import '../../../../core/constants/app_text_styles.dart';

class TasneemSection extends StatelessWidget {
  const TasneemSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPadding = Responsive.horizontalPadding(context);
    final vPadding = Responsive.verticalPadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tasneem?",
            style: AppTextStyles.heading1(
              context,
            ).copyWith(fontSize: isMobile ? 32 : 48),
          ),
          const SizedBox(height: 12),
          Text(
            "More than just a Flutter Developer.",
            style: AppTextStyles.heading2(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 900,
            ),
            child: Text(
              "I'm Tasneem Magdy, a Flutter Developer with 2+ years of experience designing, developing, and maintaining cross-platform mobile applications for Android and iOS using Flutter and Dart, backed by Python-based APIs.\n\n"
              "I have hands-on experience building scalable, production-ready applications across e-commerce, social networking, dashboards, and task management systems. My expertise includes Clean Architecture, BLoC/Cubit, Provider, RESTful APIs, Dio, Firebase, Hive, Shared Preferences, responsive UI development, and performance optimization.\n\n"
              "Beyond development, I have extensive experience in debugging, manual testing, edge-case validation, API testing, release validation across Android and iOS, TestFlight distribution, Jira task management, and Agile development practices to ensure reliable, high-quality software.\n\n"
              "I graduated from the Faculty of Computers and Data Science, Alexandria University. Alongside my professional career, I served for two years as a Teaching Assistant in the Computer Science Department, mentoring students, delivering Flutter and Software Engineering labs, supervising graduation projects, and contributing to faculty-wide technical initiatives.\n\n"
              "I'm passionate about building maintainable, scalable, and user-focused applications while continuously learning new technologies and following modern software engineering best practices.",
              style: AppTextStyles.body(
                context,
              ).copyWith(height: 1.9, fontSize: isMobile ? 15 : 17),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            '"Code with purpose. Build with passion."',
            style: AppTextStyles.heading2(context).copyWith(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}