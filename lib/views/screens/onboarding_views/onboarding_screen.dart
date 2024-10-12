import 'package:doviz_clone_app/views/screens/onboarding_views/first_onboarding_page.dart';
import 'package:doviz_clone_app/views/screens/home.dart';
import 'package:doviz_clone_app/views/screens/onboarding_views/second_onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Sayfalar için içerik
  final List<Widget> _pages = [
    const FirstOnboardingPage(),
    const SecondOnboardingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _pages[index];
              },
            ),
          ),
          // "Sonraki" ve "Bitir" düğmeleri
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == _pages.length - 1) {
                  // Son sayfadaysa, ana ekrana yönlendirme yap
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  // Sonraki sayfaya geç
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child:
                 const Text('Devam'),
            ),
          ),
        ],
      ),
    );
  }


}
