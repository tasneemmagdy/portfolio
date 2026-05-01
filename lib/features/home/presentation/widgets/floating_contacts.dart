import 'package:flutter/material.dart';
import '../../../../core/constants/app_links.dart';
import '../../../../core/utils/launcher_helper.dart';

class FloatingContacts extends StatelessWidget {
  const FloatingContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 100,
      child: Column(
        children: [
          _btn(Icons.email, AppLinks.email),
          const SizedBox(height: 10),
          _btn(Icons.link, AppLinks.linkedin),
          const SizedBox(height: 10),
          _btn(Icons.phone, "tel:01203413430"),
        ],
      ),
    );
  }

  Widget _btn(IconData icon, String url) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: const Color(0xff16213E),
      onPressed: () => LauncherHelper.open(url),
      child: Icon(icon, color: Colors.white),
    );
  }
}