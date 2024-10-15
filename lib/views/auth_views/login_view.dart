import 'dart:io';

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
                Container(
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 10 * 8.5,
                  decoration: const BoxDecoration(color: Color(0xFF1a202c)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Google ile giriş yapın",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 10 * 8.5,
                  decoration: const BoxDecoration(color: Color(0xFF1a202c)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://seeklogo.com/images/A/apple-logo-E3DBF3AE34-seeklogo.com.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Apple ile giriş yapın",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 10 * 8.5,
                  decoration: const BoxDecoration(color: Color(0xFF1a202c)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        color: Color(0xFF134b8b),
                        size: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "E-Posta ile giriş yapın",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
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
                        onPressed: () {},
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
