import 'package:flutter/material.dart';
import 'package:resume_app/views/screens/profile.dart';

class SkillsText extends StatefulWidget {
  const SkillsText({super.key});

  @override
  State<SkillsText> createState() => _SkillsTextState();
}

class _SkillsTextState extends State<SkillsText> with TickerProviderStateMixin {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0.0,
            duration: const Duration(seconds: 1),
            child: const Text(
              'Languages',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          _buildAnimatedLanguageTile(
              flag: '🇺🇿', language: 'Uzbek', level: 'native speaker'),
          _buildAnimatedLanguageTile(
              flag: '🇬🇧', language: 'English', level: 'Upper intermediate'),
          _buildAnimatedLanguageTile(
              flag: '🇷🇺', language: 'Russian', level: 'native'),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildAnimatedLanguageTile({
    required String flag,
    required String language,
    required String level,
  }) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: LanguageTile(flag: flag, language: language, level: level),
    );
  }
}
