import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:portfolio_web/core/theme/app_theme.dart';
import 'package:portfolio_web/core/theme/theme_provider.dart';
import 'package:portfolio_web/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tasneem Magdy | Mobile Developer",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: provider.isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const HomePage(),
    );
  }
}