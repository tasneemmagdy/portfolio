import 'package:flutter/material.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/launcher_helper.dart';

class CvButton extends StatelessWidget {
  const CvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        LauncherHelper.open(AppLinks.cv);
      },
      icon: const Icon(Icons.visibility),
      label: const Text("View CV"),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        backgroundColor: const Color(0xff4F8CFF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}