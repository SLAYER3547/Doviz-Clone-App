import 'package:doviz_clone_app/views/screens/onboarding_views/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainRoot());
}

class MainRoot extends StatelessWidget {
  const MainRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}



  // Daire oluşturucu





// Ana ekrana yönlendirme yapıldığı varsayılan bir ana sayfa

