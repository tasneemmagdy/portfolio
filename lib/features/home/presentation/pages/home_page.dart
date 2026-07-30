import 'package:flutter/material.dart';
import 'package:portfolio_web/core/constants/app_colors.dart';
import 'package:portfolio_web/core/utils/responsive.dart';
import 'package:portfolio_web/core/widgets/animated_background.dart';
import 'package:portfolio_web/core/widgets/theme_switch.dart';
import 'package:portfolio_web/features/home/presentation/widgets/contact_section.dart';
import 'package:portfolio_web/features/home/presentation/widgets/experience_section.dart';
import 'package:portfolio_web/features/home/presentation/widgets/hero_section.dart';
import 'package:portfolio_web/features/home/presentation/widgets/navbar.dart';
import 'package:portfolio_web/features/home/presentation/widgets/projects_section.dart';
import 'package:portfolio_web/features/home/presentation/widgets/skills_section.dart';
import 'package:portfolio_web/features/home/presentation/widgets/tasneem_section.dart';

enum Section { home, about, experience, skills, projects, contact }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController controller = ScrollController();

  Section active = Section.home;

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller.addListener(_handleScroll);
  }

  @override
  void dispose() {
    controller.removeListener(_handleScroll);
    controller.dispose();
    super.dispose();
  }

  void scrollTo(GlobalKey key) {
    if (key.currentContext == null) return;

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  void _handleScroll() {
    final sections = {
      Section.home: homeKey,
      Section.about: aboutKey,
      Section.experience: experienceKey,
      Section.skills: skillsKey,
      Section.projects: projectsKey,
      Section.contact: contactKey,
    };

    Section current = active;
    double closest = double.infinity;

    sections.forEach((section, key) {
      final context = key.currentContext;
      if (context == null) return;

      final box = context.findRenderObject() as RenderBox;
      final dy = box.localToGlobal(Offset.zero).dy;

      final distance = (dy - 120).abs();

      if (distance < closest) {
        closest = distance;
        current = section;
      }
    });

    if (current != active) {
      setState(() {
        active = current;
      });
    }
  }

  Widget _drawerItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      endDrawer: isMobile
          ? Drawer(
              child: Container(
                color: Theme.of(context).cardColor,
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "<Tasneem />",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Flutter Developer",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.withOpacity(.2)),
                      Expanded(
                        child: ListView(
                          children: [
                            _drawerItem("Home", Icons.home, () {
                              Navigator.pop(context);
                              scrollTo(homeKey);
                            }),
                            _drawerItem("About", Icons.person, () {
                              Navigator.pop(context);
                              scrollTo(aboutKey);
                            }),
                            _drawerItem("Experience", Icons.work, () {
                              Navigator.pop(context);
                              scrollTo(experienceKey);
                            }),
                            _drawerItem("Skills", Icons.code, () {
                              Navigator.pop(context);
                              scrollTo(skillsKey);
                            }),
                            _drawerItem("Projects", Icons.folder, () {
                              Navigator.pop(context);
                              scrollTo(projectsKey);
                            }),
                            _drawerItem("Contact", Icons.email, () {
                              Navigator.pop(context);
                              scrollTo(contactKey);
                            }),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Theme: ", style: TextStyle(fontSize: 16)),
                            SizedBox(width: 8),
                            ThemeSwitch(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: AnimatedBackground(
        child: Column(
          children: [
            Navbar(
              active: active,
              onHome: () => scrollTo(homeKey),
              onAbout: () => scrollTo(aboutKey),
              onExperience: () => scrollTo(experienceKey),
              onSkills: () => scrollTo(skillsKey),
              onProjects: () => scrollTo(projectsKey),
              onContact: () => scrollTo(contactKey),
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Container(key: homeKey, child: const HeroSection()),

                    Container(key: aboutKey, child: const TasneemSection()),

                    Container(
                      key: experienceKey,
                      child: const ExperienceSection(),
                    ),

                    Container(key: skillsKey, child: const SkillsSection()),

                    Container(key: projectsKey, child: const ProjectsSection()),

                    Container(key: contactKey, child: const ContactSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
