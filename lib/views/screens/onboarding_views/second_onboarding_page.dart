import 'package:flutter/material.dart';

class SecondOnboardingPage extends StatelessWidget {


  const SecondOnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/follow_list_boxes.png", height: 300), // Görsel
        const SizedBox(height: 20),
        const Text(
          "Second Page",
          style:  TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "description",
          textAlign: TextAlign.center,
          style:  TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}