import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class LogoAndTitle extends StatefulWidget {
  const LogoAndTitle({required this.title, super.key});
  final String title;

  @override
  State<LogoAndTitle> createState() => _LogoAndTitleState();
}

class _LogoAndTitleState extends State<LogoAndTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/app_logo_3.png',
          width: 150,
          height: 100,
        ),
        Text(
          widget.title,
          style: const TextStyle(
            color: defaultTextColor,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
