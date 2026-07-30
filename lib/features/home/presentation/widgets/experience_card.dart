import 'package:flutter/material.dart';
import 'package:portfolio_web/features/home/model/experience_model.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceModel experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool expanded = false;
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: expanded || hovering ? primary : Colors.grey.withOpacity(.2),
          ),
          boxShadow: [
            BoxShadow(
              color: hovering
                  ? primary.withOpacity(.15)
                  : Colors.black.withOpacity(.05),
              blurRadius: hovering ? 25 : 10,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.experience.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          widget.experience.company,
                          style: TextStyle(
                            color: primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: primary.withOpacity(.12),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            widget.experience.period,
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            expanded ? "Hide details" : "View details",
                            style: TextStyle(
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          const SizedBox(width: 6),

                          AnimatedRotation(
                            turns: expanded ? .5 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: expanded
                    ? AnimatedOpacity(
                        opacity: expanded ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            children: widget.experience.responsibilities
                                .map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color: primary,
                                          size: 18,
                                        ),

                                        const SizedBox(width: 12),

                                        Expanded(
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              height: 1.7,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
              const SizedBox(height: 20),

              if (expanded) Divider(color: Colors.grey.withOpacity(.2)),
            ],
          ),
        ),
      ),
    );
  }
}
