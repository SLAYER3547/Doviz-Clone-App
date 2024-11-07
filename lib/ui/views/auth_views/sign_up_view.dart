import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/components/auth_views_bottom_links.dart';
import 'package:doviz_clone_app/ui/components/auth_views_logo_and_title_view.dart';
import 'package:doviz_clone_app/ui/components/auth_views_route_option.dart';
import 'package:doviz_clone_app/ui/components/system_app_bar.dart';
import 'package:doviz_clone_app/ui/components/login_options_box.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: const AuthViewsAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const LogoAndTitle(title: 'Ücretsiz üye olun'),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.autorenew,
                      color: defaultTextColor,
                      size: 36,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10 * 7,
                      child: const Text(
                        'Portföyünüzü ve cüzdanınızı tüm cihazlarınızda ortak yönetin!',
                        style: TextStyle(color: defaultTextColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.brush_outlined,
                      color: defaultTextColor,
                      size: 36,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10 * 7,
                      child: const Text(
                        'Döviz uygulamasını kişiselleştirin!',
                        style: TextStyle(color: defaultTextColor, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '* Verileriniz kayıt olunan hesap ile eşitlenecektir',
                  style: TextStyle(color: defaultTextColor),
                ),
                const LoginOptionsBox(
                  imagePath:
                      'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                  loginOptionText: 'Google ile üye olun',
                ),
                const LoginOptionsBox(
                  imagePath:
                      'https://seeklogo.com/images/A/apple-logo-E3DBF3AE34-seeklogo.com.png',
                  loginOptionText: 'Apple ile üye olun',
                ),
                const LoginOptionsBox(
                  imagePath:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBPBc6ABF7dC86Cpl5dWd_ZBAbDsQq0Pq85Q&s',
                  loginOptionText: 'E-Posta ile üye olun',
                ),
                const SizedBox(
                  height: 15,
                ),
                const AuthViewsRouteOption(
                  title: 'Hesabınız var mı?',
                  linkTitle: 'Giriş yapın',
                ),
              ],
            ),
          ),
          const AuthViewsBottomLinks(),
        ],
      ),
    );
  }
}
