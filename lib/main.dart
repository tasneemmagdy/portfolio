import 'package:flutter/material.dart';
import 'package:portfolio_web/core/theme/app_theme.dart';
import 'package:portfolio_web/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tasneem Portfolio",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}