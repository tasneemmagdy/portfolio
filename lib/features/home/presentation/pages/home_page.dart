import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';

enum Section { home, skills, projects, contact }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();

  Section active = Section.home;

  final homeKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  void onScroll() {
    final offset = controller.offset;

    setState(() {
      if (offset < 300) {
        active = Section.home;
      } else if (offset < 800) {
        active = Section.skills;
      } else if (offset < 1400) {
        active = Section.projects;
      } else {
        active = Section.contact;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            active: active,
            onHome: () => scrollTo(homeKey),
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
                  Container(key: skillsKey, child: const SkillsSection()),
                  Container(key: projectsKey, child: const ProjectsSection()),
                  Container(key: contactKey, child: const ContactSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}