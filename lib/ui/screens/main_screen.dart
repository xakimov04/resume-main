import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/logic/bloc/download_pdf_bloc.dart';
import 'package:resume_app/ui/screens/academic_page.dart';
import 'package:resume_app/ui/screens/home_screen.dart';
import 'package:resume_app/ui/screens/languages.dart';
import 'package:resume_app/ui/screens/skills_text.dart';
import 'package:resume_app/ui/screens/summary_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SummaryPage(),
    AcademicBackgroundPage(),
    SkillsText(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          BlocListener<DownloadPdfBloc, DownloadPdfState>(
            listener: (context, state) {
              if (state is LoadedPdfState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to downloads")),
                );
              }
            },
            child: IconButton(
              onPressed: () {
                context.read<DownloadPdfBloc>().add(DownloadPdfEvent());
              },
              icon: const Icon(Icons.picture_as_pdf),
            ),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              _currentIndex = 0;
              setState(() {});
            },
            icon: const Icon(Icons.battery_charging_full_rounded),
          ),
          IconButton(
            icon: const Icon(Icons.school),
            onPressed: () {
              _currentIndex = 1;
              setState(() {});
            },
          ),
          IconButton(
            onPressed: () {
              _currentIndex = 2;
              setState(() {});
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _currentIndex = 3;
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.contact_support),
            onPressed: () {
              _currentIndex = 4;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
