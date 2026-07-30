import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import 'package:portfolio_web/core/widgets/animated_role_text.dart';
import '../../../../core/constants/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPadding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: Responsive.verticalPadding(context),
      ),

      child: isMobile
          ? const Column(
              children: [_LeftContent(), SizedBox(height: 50), _PhonePreview()],
            )
          : const Row(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Expanded(flex: 5, child: _LeftContent()),

                SizedBox(width: 60),

                Expanded(flex: 4, child: _PhonePreview()),
              ],
            ),
    );
  }
}

class _LeftContent extends StatelessWidget {
  const _LeftContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text("Hi, I'm", style: AppTextStyles.body(context)),

        const SizedBox(height: 15),

        Text(
          "Tasneem\nMagdy",

          style: AppTextStyles.heading1(
            context,
          ).copyWith(fontSize: 60, height: 1),
        ),

        const SizedBox(height: 20),

        AnimatedRoleText(
          roles: const [
            "Flutter Developer",

            "Mobile Engineer",

            "Software Engineer",

            "Clean Architecture Enthusiast",
          ],

          style: AppTextStyles.heading2(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.primary),
        ),

        const SizedBox(height: 25),

        SizedBox(
          width: Responsive.isMobile(context)
              ? double.infinity
              : (Responsive.isTablet(context) ? 400 : 550),

          child: Text(
            "Building scalable, beautiful and production-ready Flutter applications using Clean Architecture, Firebase, REST APIs and modern state management.",

            style: AppTextStyles.body(context),
          ),
        ),

        const SizedBox(height: 45),

        Wrap(
          spacing: 16,

          runSpacing: 16,

          children: const [
            _InfoCard("2+", "Years"),

            _InfoCard("6+", "Projects"),

            _InfoCard("100%", "Passion"),
          ],
        ),
      ],
    );
  }
}

class _PhonePreview extends StatelessWidget {
  const _PhonePreview();

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Center(
      child: Container(
        width: 320,

        height: 620,

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),

          color: Theme.of(context).cardColor,

          border: Border.all(color: Theme.of(context).dividerColor),

          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.15),

              blurRadius: 40,

              offset: const Offset(0, 20),
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.85),

            borderRadius: BorderRadius.circular(30),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  _dot(Colors.redAccent),

                  const SizedBox(width: 6),

                  _dot(Colors.yellow),

                  const SizedBox(width: 6),

                  _dot(Colors.green),
                ],
              ),

              const SizedBox(height: 30),

              Text(
                "flutter_app.dart",

                style: TextStyle(color: primary, fontSize: 14),
              ),

              const SizedBox(height: 20),

              const Text(
                """
class MyApp extends StatelessWidget {

  @override
  Widget build(context){

    return MaterialApp(
      home: HomePage(),
    );

  }

}
""",

                style: TextStyle(
                  color: Colors.white70,

                  fontSize: 14,

                  height: 1.8,

                  fontFamily: "monospace",
                ),
              ),

              const Spacer(),

              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,

                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: primary.withOpacity(.15),

                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    "Flutter Developer",

                    style: TextStyle(
                      color: primary,

                      fontWeight: FontWeight.bold,
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

  Widget _dot(Color color) {
    return CircleAvatar(radius: 8, backgroundColor: color);
  }
}

class _InfoCard extends StatelessWidget {
  final String number;

  final String title;

  const _InfoCard(this.number, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: Theme.of(context).dividerColor),
      ),

      child: Column(
        children: [
          Text(
            number,

            style: TextStyle(
              fontSize: 28,

              fontWeight: FontWeight.bold,

              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          const SizedBox(height: 8),

          Text(title, style: AppTextStyles.small(context)),
        ],
      ),
    );
  }
}
