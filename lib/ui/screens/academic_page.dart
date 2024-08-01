import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/ui/widgets/contact_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AcademicBackgroundPage extends StatelessWidget {
  const AcademicBackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Project',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://github.com/Aabdulloh2005?tab=repositories');
                  },
                  child: const AcademicItem(
                    title: 'Mening Oilam',
                    subtitle: 'It is mobile app',
                    icon: FontAwesomeIcons.person,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://github.com/Aabdulloh2005/qr_scanner_app');
                  },
                  child: const AcademicItem(
                    title: 'Scanner App',
                    subtitle:
                        'Application for scanning  and generating qr codes',
                    icon: FontAwesomeIcons.qrcode,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class AcademicItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const AcademicItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.pinkAccent,
            size: 40,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
