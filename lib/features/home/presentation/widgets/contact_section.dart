import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/utils/launcher_helper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  final String phone = "01203413430";
  final String email = "tasneemmagdy299@gmail.com";

  void copy(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Copied to clipboard")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Contact", style: AppTextStyles.heading2),
              const SizedBox(height: 20),

              FadeInUp(
                child: _card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            LauncherHelper.open("mailto:$email"),
                        child: Text(email,
                            style: const TextStyle(color: Colors.white70)),
                      ),
                      IconButton(
                        onPressed: () => copy(context, email),
                        icon: const Icon(Icons.copy,
                            color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              FadeInUp(
                child: _card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            LauncherHelper.open("tel:$phone"),
                        child: Text(phone,
                            style: const TextStyle(color: Colors.white70)),
                      ),
                      IconButton(
                        onPressed: () => copy(context, phone),
                        icon: const Icon(Icons.copy,
                            color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}