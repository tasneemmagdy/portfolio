import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'image_gallery.dart';

class ProjectDetailsDialog extends StatelessWidget {
  final String title;
  final String problem;
  final String solution;
  final List<String> features;
  final List<String> technologies;
  final List<String> images;
  final String github;
  final String? demo;

  const ProjectDetailsDialog({
    super.key,
    required this.title,
    required this.problem,
    required this.solution,
    required this.features,
    required this.technologies,
    required this.images,
    required this.github,
    this.demo,
  });

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    final double hInset = isMobile ? 12 : (isTablet ? 30 : 60);
    final double vInset = isMobile ? 12 : (isTablet ? 20 : 40);

    return Dialog(
      backgroundColor: Theme.of(context).cardColor,
      insetPadding: EdgeInsets.symmetric(horizontal: hInset, vertical: vInset),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobile ? double.infinity : 1100,
          maxHeight: isMobile ? MediaQuery.of(context).size.height * 0.95 : 800,
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Title & Close Button
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    tooltip: 'Close',
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Main Body Section
              Expanded(
                child: isMobile
                    ? Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: ImageGallery(images: images),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            flex: 6,
                            child: SingleChildScrollView(
                              child: _buildDetailsContent(context, primary),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Side: Image Gallery
                          Expanded(
                            flex: 6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: ImageGallery(images: images),
                            ),
                          ),
                          const SizedBox(width: 28),
                          // Right Side: Details Content
                          Expanded(
                            flex: 5,
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(right: 8),
                              child: _buildDetailsContent(context, primary),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsContent(BuildContext context, Color primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title("Problem", Colors.redAccent),
        const SizedBox(height: 8),
        _body(problem),
        const SizedBox(height: 24),

        _title("Solution", Colors.green),
        const SizedBox(height: 8),
        _body(solution),
        const SizedBox(height: 24),

        _title("Key Features", primary),
        const SizedBox(height: 12),
        ...features.map(
          (feature) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle_rounded,
                  color: primary,
                  size: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    feature,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        _title("Tech Stack", Colors.orangeAccent),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map(
                (tech) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: primary.withOpacity(.3),
                    ),
                  ),
                  child: Text(
                    tech,
                    style: TextStyle(
                      color: primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 32),

        // Action Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _launchUrl(github),
              icon: const Icon(Icons.code),
              label: const Text("GitHub"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            if (demo != null && demo!.isNotEmpty)
              OutlinedButton.icon(
                onPressed: () => _launchUrl(demo!),
                icon: const Icon(Icons.play_circle_fill),
                label: const Text("View Demo"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _title(String title, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  Widget _body(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        height: 1.6,
      ),
    );
  }
}