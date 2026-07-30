import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.speed = const Duration(milliseconds: 80),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  String displayed = "";
  Timer? timer;
  int index = 0;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(widget.speed, (timer) {
      if (index >= widget.text.length) {
        timer.cancel();
        return;
      }

      setState(() {
        displayed += widget.text[index];
        index++;
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
    return Text(
      displayed,
      style: widget.style,
    );
  }
}