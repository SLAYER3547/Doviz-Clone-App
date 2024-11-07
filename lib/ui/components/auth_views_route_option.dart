import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/auth_views/login_view.dart';
import 'package:doviz_clone_app/ui/views/auth_views/sign_up_view.dart';
import 'package:flutter/material.dart';

class AuthViewsRouteOption extends StatefulWidget {
  const AuthViewsRouteOption({
    required this.title,
    required this.linkTitle,
    super.key,
  });
  final String title;
  final String linkTitle;

  @override
  State<AuthViewsRouteOption> createState() => _AuthViewsRouteOptionState();
}

class _AuthViewsRouteOptionState extends State<AuthViewsRouteOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: defaultTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {
            widget.linkTitle == 'Giriş yapın'
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
          },
          child: Text(
            widget.linkTitle,
            style: const TextStyle(
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
    );
  }
}
