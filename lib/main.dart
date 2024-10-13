import 'package:doviz_clone_app/app/router.dart';
import 'package:doviz_clone_app/views/app_view.dart';
import 'package:doviz_clone_app/views/screens/onboarding_views/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainRoot());
}

class MainRoot extends StatelessWidget {
  const MainRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}




