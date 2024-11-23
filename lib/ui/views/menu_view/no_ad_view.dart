import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class NoAdView extends StatelessWidget {
  const NoAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: iconColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/app_logo_3.png',
                    height: 150,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.block,
                        color: iconColor,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Bizi reklamsız takip edin',
                        style: TextStyle(color: defaultTextColor, fontSize: 22),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: systemMainGreyColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Text(
                      'HEMEN AL ₺4,99/AY',
                      style: TextStyle(
                        color: defaultTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kullanıcı Sözleşmesi ',
                style: TextStyle(
                    color: defaultTextColor,),    
              ),
              Text(
                've ',
                style: TextStyle(color: defaultTextColor),
              ),
              Text(
                'Gizlilik Şartları',
                style: TextStyle(
                    color: defaultTextColor,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
