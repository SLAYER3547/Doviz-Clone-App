import 'package:flutter/material.dart';

class LoginOptionsBox extends StatelessWidget {
  const LoginOptionsBox({
    required this.imagePath,
    required this.loginOptionText,
    super.key,
  });
  final String imagePath;
  final String loginOptionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width / 10 * 8.5,
      decoration: const BoxDecoration(color: Color(0xFF1a202c)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imagePath,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            loginOptionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
