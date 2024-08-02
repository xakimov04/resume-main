import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with TickerProviderStateMixin {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                child: const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 2),
                child: _isVisible
                    ? const Text(
                        'Mardon Hakimov',
                        key: ValueKey('name'),
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    : const SizedBox(),
              ),
            ),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 2),
                child: _isVisible
                    ? const Text(
                        'Flutter Developer',
                        key: ValueKey('title'),
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    : const SizedBox(),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              child: _isVisible
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bio',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Hello! I am based in Culleredo, Galiza (Spain) and I am a passionate Flutter developer with experience in building beautiful and functional mobile applications.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const ContactInfo(
              icon: Icons.phone,
              info: '+998 97 421 0412',
            ),
            const ContactInfo(
              icon: Icons.email,
              info: 'mardonhakimov0404@gmail.com',
            ),
            const SizedBox(height: 24),
            const Text(
              'Social Media',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialMediaButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: "https://linkedin.com/in/mardon-hakimov-60aa892b2",
                ),
                SocialMediaButton(
                  icon: FontAwesomeIcons.instagram,
                  url: "https://www.instagram.com/xakim0v_m/",
                ),
                SocialMediaButton(
                  icon: FontAwesomeIcons.telegram,
                  url: "https://t.me/developer_000",
                ),
                SocialMediaButton(
                  icon: FontAwesomeIcons.github,
                  url: "https://github.com/xakimov04",
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                AnimatedSkillChip(label: 'Flutter'),
                AnimatedSkillChip(label: 'Dart'),
                AnimatedSkillChip(label: 'Firebase'),
                AnimatedSkillChip(label: 'REST API'),
                AnimatedSkillChip(label: 'Git'),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  launchUrlString("https://example.com/cv.pdf");
                },
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const SocialMediaButton({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, size: 30, color: Colors.blueGrey),
      onPressed: () {
        launchUrlString(url);
      },
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.blueGrey),
          const SizedBox(width: 16),
          Text(info, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class AnimatedSkillChip extends StatelessWidget {
  final String label;

  const AnimatedSkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
