import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, .2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget skillChip(BuildContext context, String text) {
    return _SkillChip(text: text);
  }

  Widget skillCategory(
    BuildContext context,
    String title,
    List<String> skills,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: skills.map((skill) => skillChip(context, skill)).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final hPadding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: Responsive.sectionVerticalPadding(context),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Skills",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  skillCategory(context, "Technical Skills", [
                    "Flutter",
                    "Dart",
                    "Clean Architecture",
                    "BLoC",
                    "Cubit",
                    "Provider",
                    "GetX",
                    "Firebase",
                    "Firebase Auth",
                    "FCM push Notifications",
                    "Payment Integration",
                    "Map Integration",
                    "REST APIs",
                    "Dio",
                    "Hive",
                    "Localization",
                    "Git & GitHub",
                    "CI/CD",
                    "Android",
                    "iOS",
                    "Flutter Web",
                    "Java",
                    "Python",
                    "SQL",
                    "Unit Testing",
                    "Django",
                    "Postman",
                    "OOP",
                    "Responsive UI Developmen",
                    "Manual Testing (Functional, Smoke, Regression, Integration, End-to-End) ",
                    "Jira",
                    " TestFlight"
                  ]),
                  const SizedBox(height: 35),
                  skillCategory(context, "Soft Skills", [
                    "Collaboration",
                    "Problem Solving",
                    "Communication",
                    "Time Management",
                    "Adaptability",
                    "Attention to Detail",
                    "Mentoring",
                  ]),
                  const SizedBox(height: 35),
                  skillCategory(context, "Additional Skills", [
                    "Public Speaking",
                    "Writing",
                    "Research",
                    "Teamwork",
                    "Analytical Thinking",
                    "Documentation",
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String text;
  const _SkillChip({required this.text});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, hovering ? -5 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: hovering ? primary.withOpacity(.2) : primary.withOpacity(.12),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: hovering ? primary : primary.withOpacity(.25),
          ),
          boxShadow: hovering
              ? [
                  BoxShadow(
                    color: primary.withOpacity(.2),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: primary,
            fontWeight: hovering ? FontWeight.bold : FontWeight.w600,
            fontSize: hovering ? 15 : 14,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
