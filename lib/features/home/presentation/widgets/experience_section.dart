import 'package:flutter/material.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../data/experience_data.dart';
import 'experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPadding = Responsive.horizontalPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
        vertical: Responsive.verticalPadding(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Experience", style: AppTextStyles.heading1(context)),
          const SizedBox(height: 12),
          Text(
            "A journey of learning, building, and growing.",
            style: AppTextStyles.heading2(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 60),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              return ExperienceCard(experience: experiences[index]);
            },
          ),
        ],
      ),
    );
  }
}
