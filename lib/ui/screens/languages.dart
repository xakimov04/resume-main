import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Hello! I am based in Culleredo, Galiza (Spain) and there are plenty of ways to get in touch with me:',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const ContactInfo(
            icon: Icons.phone,
            info: '+998990600862',
          ),
          const ContactInfo(
            icon: Icons.email,
            info: 'ganievabdulloh2005@gmail.com',
          ),
          const ContactInfo(
            icon: Icons.web,
            info: 'flutter.com',
          ),
          const ContactInfo(
            icon: Icons.link,
            info: 'resume',
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  launchUrlString(
                      "https://github.com/Aabdulloh2005?tab=repositories");
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram),
                onPressed: () {
                  launchUrlString(
                      "https://github.com/Aabdulloh2005?tab=repositories");
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.telegram),
                onPressed: () {
                  launchUrlString("https://t.me/Aabu2005");
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () {
                  launchUrlString(
                      "https://github.com/Aabdulloh2005?tab=repositories");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String flag;
  final String language;
  final String level;

  const LanguageTile(
      {super.key,
      required this.flag,
      required this.language,
      required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                language,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(level),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String info;

  const ContactInfo({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Text(info, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
