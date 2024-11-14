import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  // ignore: public_member_api_docs, use_super_parameters
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // ignore: avoid_void_async
  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2)); // 2 saniye bekleme
    // ignore: use_build_context_synchronously
    context.go('/'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/images/app_logo_3.png', 
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
