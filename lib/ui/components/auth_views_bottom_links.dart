import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class AuthViewsBottomLinks extends StatelessWidget {
  const AuthViewsBottomLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Kullanıcı Sözleşmesi',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: systemBlueColor,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 3,
                  color: systemBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const Text(
              've',
              style: TextStyle(color: defaultTextColor, fontSize: 16),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Gizlilik Şartları',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: systemBlueColor,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 3,
                  color: systemBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sorun yaşıyorsanız',
              style: TextStyle(
                color: defaultTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'bize ulaşın!',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: systemBlueColor,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 3,
                  color: systemBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
