import 'package:flutter/material.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/launcher_helper.dart';

class CvButton extends StatelessWidget {
  const CvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            LauncherHelper.open(AppLinks.cv);
          },
          child: const Text("View CV"),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {
            LauncherHelper.open(AppLinks.cv);
          },
          child: const Text("Download CV"),
        ),
      ],
    );
  }
}