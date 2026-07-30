import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/launcher_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  final String phone = "01203413430";
  final String email = "tasneemmagdy299@gmail.com";
  final String github = "https://github.com/tasneemmagdy";
  final String linkedin = "https://www.linkedin.com/in/tasneem-magdy/";

  void copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Copied to clipboard")));
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
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contact",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FadeInUp(
                child: _contactCard(
                  context,
                  title: email,
                  copyValue: email,
                  onTap: () => LauncherHelper.open("mailto:$email"),
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                delay: const Duration(milliseconds: 100),
                child: _contactCard(
                  context,
                  title: phone,
                  copyValue: phone,
                  onTap: () => LauncherHelper.open("tel:$phone"),
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: _contactCard(
                  context,
                  title: "GitHub",
                  copyValue: github,
                  onTap: () => LauncherHelper.open(github),
                ),
              ),
              const SizedBox(height: 16),
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: _contactCard(
                  context,
                  title: "LinkedIn",
                  copyValue: linkedin,
                  onTap: () => LauncherHelper.open(linkedin),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    LauncherHelper.open(
                      "assets/cv/TasneemMagdy_Resume.pdf",
                    );
                  },
                  icon: const Icon(Icons.download),
                  label: const Text("Download Resume"),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _contactCard(
    BuildContext context, {
    required String title,
    required String copyValue,
    required VoidCallback onTap,
  }) {
    // جلب لون النص الرئيسي من الثيم الحالي (سواء لايت أو دارك)
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ) ??
        TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16,
        );

    final iconColor = Theme.of(context).iconTheme.color ?? 
        Theme.of(context).colorScheme.onSurface.withOpacity(0.7);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ),
          IconButton(
            tooltip: "Copy",
            onPressed: () => copy(context, copyValue),
            icon: Icon(Icons.copy, color: iconColor),
          ),
        ],
      ),
    );
  }
}