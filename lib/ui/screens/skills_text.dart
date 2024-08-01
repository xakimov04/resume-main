import 'package:flutter/material.dart';
import 'package:resume_app/ui/screens/languages.dart';

class SkillsText extends StatelessWidget {
  const SkillsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Languages',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          LanguageTile(
              flag: '🇺🇿', language: 'Uzbek', level: 'native speaker'),
          LanguageTile(
              flag: '🇬🇧', language: 'English', level: 'Upper intermediate'),
          LanguageTile(flag: '🇷🇺', language: 'Russian', level: 'native'),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
