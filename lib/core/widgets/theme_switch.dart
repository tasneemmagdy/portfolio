import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: provider.toggleTheme,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Text(
              "☀️",
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(width: 8),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 55,
              height: 28,
              decoration: BoxDecoration(
                color: provider.isDark
                    ? Colors.grey.shade800
                    : Colors.orange.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: provider.isDark
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(3),
                  width: 22,
                  height: 22,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            const Text(
              "🌙",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}