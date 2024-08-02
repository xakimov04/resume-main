import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SummaryItem(
            icon: Icons.code,
            title: 'Flutter Expert',
            description:
                'Proficient in building cross-platform mobile applications using Flutter and Dart.',
          ),
          SummaryItem(
            icon: Icons.design_services,
            title: 'UI/UX Designer',
            description:
                'Skilled in designing user-friendly interfaces with Figma and Adobe XD.',
          ),
          SummaryItem(
            icon: Icons.integration_instructions,
            title: 'Integration Specialist',
            description:
                'Experienced in integrating RESTful APIs and third-party services into mobile apps.',
          ),
          SummaryItem(
            icon: Icons.update,
            title: 'Continuous Learner',
            description:
                'Always eager to learn the latest trends and technologies in mobile app development.',
          ),
        ],
      ),
    );
  }
}

class SummaryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const SummaryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blueAccent,
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
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
