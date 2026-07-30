import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedRoleText extends StatefulWidget {
  final List<String> roles;
  final TextStyle? style;

  const AnimatedRoleText({
    super.key,
    required this.roles,
    this.style,
  });

  @override
  State<AnimatedRoleText> createState() => _AnimatedRoleTextState();
}

class _AnimatedRoleTextState extends State<AnimatedRoleText> {
  int roleIndex = 0;
  int charIndex = 0;

  String text = "";

  bool deleting = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() {
    timer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      final current = widget.roles[roleIndex];

      setState(() {
        if (!deleting) {
          if (charIndex < current.length) {
            charIndex++;
            text = current.substring(0, charIndex);
          } else {
            deleting = true;

            timer.cancel();

            Future.delayed(const Duration(milliseconds: 1200), () {
              if (mounted) {
                _animate();
              }
            });
          }
        } else {
          if (charIndex > 0) {
            charIndex--;
            text = current.substring(0, charIndex);
          } else {
            deleting = false;
            roleIndex = (roleIndex + 1) % widget.roles.length;

            timer.cancel();

            Future.delayed(const Duration(milliseconds: 250), () {
              if (mounted) {
                _animate();
              }
            });
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: widget.style,
        ),
        const _BlinkingCursor(),
      ],
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  const _BlinkingCursor();

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor> {
  bool visible = true;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        visible = !visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: visible ? 1 : 0,
      child: Text(
        "|",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}