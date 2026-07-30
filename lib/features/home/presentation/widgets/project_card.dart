import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import 'project_details_dialog.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String problem;
  final String solution;
  final List<String> features;
  final List<String> technologies;
  final List<String> images;
  final String github;
  final String? demo;

  const ProjectCard({
    super.key,
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

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovering = false;

  Widget _buildPlaceholder(Color color) {
    return Container(
      height: 210,
      width: double.infinity,
      color: color.withOpacity(.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image_outlined, size: 48, color: color.withOpacity(.3)),
          const SizedBox(height: 8),
          Text(
            "No Preview",
            style: TextStyle(color: color.withOpacity(.4), fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, hovering ? -8 : 0, 0),
        width: isMobile ? double.infinity : 380,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: hovering ? primary : Colors.grey.withOpacity(.2),
          ),
          boxShadow: [
            BoxShadow(
              color: hovering
                  ? primary.withOpacity(.18)
                  : Colors.black.withOpacity(.05),
              blurRadius: hovering ? 24 : 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.title,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: widget.images.isNotEmpty
                    ? Image.asset(
                        widget.images.first,
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholder(primary),
                      )
                    : _buildPlaceholder(primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: TextStyle(color: Colors.grey.shade600, height: 1.7),
                  ),
                  const SizedBox(height: 22),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.technologies
                        .map(
                          (tech) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: primary.withOpacity(.12),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Icon(
                        Icons.photo_library_outlined,
                        color: primary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${widget.images.length} Screenshots",
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // زرار View Details واخد المساحة الكاملة بعد مسح GitHub
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (_) => ProjectDetailsDialog(
                            title: widget.title,
                            problem: widget.problem,
                            solution: widget.solution,
                            features: widget.features,
                            technologies: widget.technologies,
                            images: widget.images,
                            github: widget.github,
                            demo: widget.demo,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "View Details",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}