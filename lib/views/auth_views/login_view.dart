import 'package:doviz_clone_app/views/auth_views/sign_up_view.dart';
import 'package:doviz_clone_app/views/widgets/login_options_box.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.all(12),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                )),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/app_logo_3.png",
                  width: 150,
                  height: 100,
                ),
                const Text(
                  "Giriş Yapın",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600),
                ),
                const LoginOptionsBox(
                    imagePath:
                        "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                    loginOptionText: "Google ile giriş yapın"),
                const LoginOptionsBox(
                    imagePath:
                        "https://seeklogo.com/images/A/apple-logo-E3DBF3AE34-seeklogo.com.png",
                    loginOptionText: "Apple ile giriş yapın"),
                const LoginOptionsBox(
                    imagePath:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBPBc6ABF7dC86Cpl5dWd_ZBAbDsQq0Pq85Q&s",
                    loginOptionText: "E-Posta ile giriş yapın"),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hesabınız yok mu?",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        },
                        child: const Text(
                          "üye olun",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF185fb9),
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 3.0,
                              color: Color(0xFF185fb9),
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Kullanıcı Sözleşmesi",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF185fb9),
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 3.0,
                            color: Color(0xFF185fb9),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                  const Text("ve",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Gizlilik Şartları",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF185fb9),
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 3.0,
                            color: Color(0xFF185fb9),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sorun yaşıyorsanız",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "bize ulaşın!",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF185fb9),
                            decorationStyle: TextDecorationStyle.solid,
                            decorationThickness: 3.0,
                            color: Color(0xFF185fb9),
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
