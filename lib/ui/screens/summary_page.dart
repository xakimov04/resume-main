import 'package:flutter/material.dart';
import 'package:resume_app/ui/widgets/contact_widget.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SummaryItem(
            icon: Icons.widgets,
            title: 'Polivalent',
            description:
                'Plenty of skills around communication, media, web and advertising.',
          ),
          SummaryItem(
            icon: Icons.work,
            title: 'Experience',
            description:
                'More than 10 years working in design fields, with Adobe Creative Suite, Figma and collaborative tools.',
          ),
          SummaryItem(
            icon: Icons.chat_bubble,
            title: 'Open-minded',
            description:
                'Always looking for continuous improvement and ready to learn about the newest.',
          ),
          SummaryItem(
            icon: Icons.sentiment_satisfied,
            title: 'Empathic & humble',
            description: 'The user is in the center.',
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
            color: Colors.blue,
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
