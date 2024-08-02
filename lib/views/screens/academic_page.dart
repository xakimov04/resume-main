import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
         
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://github.com/xakimov04/flutter_weather_app');
                  },
                  child: const AcademicItem(
                    title: 'Weather App',
                    subtitle: 'A weather forecast application using Flutter.',
                    icon: FontAwesomeIcons.cloudSun,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString('https://github.com/xakimov04/chat');
                  },
                  child: const AcademicItem(
                    title: 'Chat App',
                    subtitle:
                        'A real-time chat application using Flutter and Firebase.',
                    icon: FontAwesomeIcons.comments,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString('https://github.com/xakimov04/todo_app');
                  },
                  child: const AcademicItem(
                    title: 'To-Do App',
                    subtitle:
                        'A task management app to keep track of daily tasks.',
                    icon: FontAwesomeIcons.tasks,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        'https://github.com/xakimov04/flutter_music_player');
                  },
                  child: const AcademicItem(
                    title: 'Music Player',
                    subtitle:
                        'A music player app with beautiful UI and features.',
                    icon: FontAwesomeIcons.music,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString('https://github.com/xakimov04/qr_code');
                  },
                  child: const AcademicItem(
                    title: 'Scanner App',
                    subtitle:
                        'Application for scanning and generating QR codes.',
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
            color: Colors.blue,
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
