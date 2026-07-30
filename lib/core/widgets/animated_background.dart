import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: [
            Container(color: Theme.of(context).scaffoldBackgroundColor),

            Positioned(
              left: 80 + controller.value * 100,
              top: 100,
              child: _blob(
                dark ? Colors.purpleAccent : Colors.deepPurpleAccent,
                260,
              ),
            ),

            Positioned(
              right: 100,
              top: 250 + controller.value * 120,
              child: _blob(Colors.cyanAccent, 220),
            ),

            Positioned(
              bottom: 120,
              left: 250 - controller.value * 80,
              child: _blob(Colors.pinkAccent, 240),
            ),

            widget.child,
          ],
        );
      },
    );
  }

  Widget _blob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(.18),
        shape: BoxShape.circle,
      ),
    );
  }
}
