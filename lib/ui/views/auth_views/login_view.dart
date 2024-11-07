import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/components/auth_views_bottom_links.dart';
import 'package:doviz_clone_app/ui/components/auth_views_logo_and_title_view.dart';
import 'package:doviz_clone_app/ui/components/auth_views_route_option.dart';
import 'package:doviz_clone_app/ui/components/system_app_bar.dart';
import 'package:doviz_clone_app/ui/components/login_options_box.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AuthViewsAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                LogoAndTitle(title: 'Giriş Yapın'),
                LoginOptionsBox(
                  imagePath:
                      'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                  loginOptionText: 'Google ile giriş yapın',
                ),
                LoginOptionsBox(
                  imagePath:
                      'https://seeklogo.com/images/A/apple-logo-E3DBF3AE34-seeklogo.com.png',
                  loginOptionText: 'Apple ile giriş yapın',
                ),
                LoginOptionsBox(
                  imagePath:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBPBc6ABF7dC86Cpl5dWd_ZBAbDsQq0Pq85Q&s',
                  loginOptionText: 'E-Posta ile giriş yapın',
                ),
                SizedBox(
                  height: 15,
                ),
                AuthViewsRouteOption(
                    title: 'Hesabınız yok mu?', linkTitle: 'üye olun',),
              ],
            ),
          ),
          AuthViewsBottomLinks(),
        ],
      ),
    );
  }
}
