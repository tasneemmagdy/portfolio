import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import 'package:portfolio_web/features/home/data/projects_data.dart';
import 'package:portfolio_web/features/home/presentation/widgets/project_card.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
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
      begin: const Offset(0, .15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
          constraints: const BoxConstraints(maxWidth: 1250),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Projects",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "A selection of production and personal Flutter projects demonstrating clean architecture, responsive UI, state management, and scalable application development.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Wrap(
                    spacing: 28,
                    runSpacing: 28,
                    alignment: WrapAlignment.center,
                    children: projects
                        .map(
                          (project) => ProjectCard(
                            title: project.title,
                            description: project.description,
                            problem: project.problem,
                            solution: project.solution,
                            features: project.features,
                            technologies: project.technologies,
                            images: project.images,
                            github: project.github,
                            demo: project.demo,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
