import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import 'package:portfolio_web/core/widgets/theme_switch.dart';
import 'package:portfolio_web/features/home/presentation/pages/home_page.dart';

class Navbar extends StatefulWidget {
  final Section active;

  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onExperience;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const Navbar({
    super.key,
    required this.active,
    required this.onHome,
    required this.onAbout,
    required this.onExperience,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
  });

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final Map<Section, GlobalKey> keys = {
    Section.home: GlobalKey(),
    Section.about: GlobalKey(),
    Section.experience: GlobalKey(),
    Section.skills: GlobalKey(),
    Section.projects: GlobalKey(),
    Section.contact: GlobalKey(),
  };

  double indicatorLeft = 0;
  double indicatorWidth = 0;

  @override
  void didUpdateWidget(covariant Navbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateIndicator();
    });
  }

  void updateIndicator() {
    final key = keys[widget.active];
    if (key == null) return;
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) return;
    final position = box.localToGlobal(Offset.zero);
    final parent = context.findRenderObject() as RenderBox;
    final parentPosition = parent.globalToLocal(position);
    setState(() {
      indicatorLeft = parentPosition.dx;
      indicatorWidth = box.size.width;
    });
  }

  Widget navItem(
    String title,
    Section section,
    VoidCallback onTap, {
    double? fontSize,
  }) {
    final active = widget.active == section;
    return Container(
      key: keys[section],
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 14 : 18,
            vertical: Responsive.isMobile(context) ? 8 : 10,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: active
                  ? AppColors.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(.7),
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? (Responsive.isTablet(context) ? 13 : 15),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _navItems() {
    return [
      navItem("Home", Section.home, widget.onHome),
      navItem("About", Section.about, widget.onAbout),
      navItem(
        "Experience",
        Section.experience,
        widget.onExperience,
        fontSize: Responsive.isTablet(context) ? 12 : null,
      ),
      navItem("Skills", Section.skills, widget.onSkills),
      navItem("Projects", Section.projects, widget.onProjects),
      navItem("Contact", Section.contact, widget.onContact),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 10 : 18),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              height: isMobile ? 60 : 75,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : (isTablet ? 18 : 30),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(.7),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.white.withOpacity(.08)),
              ),
              child: Row(
                children: [
                  Text(
                    "<Tasneem />",
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  const Spacer(),

                  if (isMobile) ...[
                    Builder(
                      builder: (drawerContext) => IconButton(
                        icon: Icon(
                          Icons.menu_rounded,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        onPressed: () {
                          Scaffold.of(drawerContext).openEndDrawer();
                        },
                      ),
                    ),
                    const ThemeSwitch(),
                  ] else ...[
                    // Desktop & Tablet: show nav links
                    if (isTablet)
                      // On tablet, use scrollable nav to prevent overflow
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ..._navItems(),
                              const SizedBox(width: 12),
                              const ThemeSwitch(),
                            ],
                          ),
                        ),
                      )
                    else
                      Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                            left: indicatorLeft,
                            bottom: 5,
                            width: indicatorWidth,
                            height: 42,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(.15),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ..._navItems(),
                              const SizedBox(width: 12),
                              const ThemeSwitch(),
                            ],
                          ),
                        ],
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
