import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_app/bloc/download_pdf_bloc.dart';
import 'package:resume_app/views/screens/academic_page.dart';
import 'package:resume_app/views/screens/home_screen.dart';
import 'package:resume_app/views/screens/profile.dart';
import 'package:resume_app/views/screens/skills_text.dart';
import 'package:resume_app/views/screens/summary_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = const [
    HomeScreen(),
    SummaryPage(),
    AcademicBackgroundPage(),
    SkillsText(),
    ContactScreen(),
  ];

  bool _isDownloading = false;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),
        title: Text(
          _currentIndex == 0
              ? ""
              : _currentIndex == 1
                  ? "Summary"
                  : _currentIndex == 2
                      ? "My Projects"
                      : _currentIndex == 3
                          ? "Skills"
                          : _currentIndex == 4
                              ? "Contact me"
                              : "",
        ),
        actions: [
          BlocListener<DownloadPdfBloc, DownloadPdfState>(
            listener: (context, state) {
              if (state is LoadingPdfState) {
                setState(() {
                  _isDownloading = true;
                });
              } else if (state is LoadedPdfState) {
                setState(() {
                  _isDownloading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to downloads")),
                );
              } else if (state is ErrorPdfState) {
                setState(() {
                  _isDownloading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<DownloadPdfBloc>().add(DownloadPdfEvent());
                  },
                  icon: const Icon(Icons.picture_as_pdf),
                ),
                if (_isDownloading)
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: 'Summary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Academics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
