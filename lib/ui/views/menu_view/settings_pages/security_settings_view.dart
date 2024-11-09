import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class SecuritySettingsView extends StatefulWidget {
  const SecuritySettingsView({super.key});

  @override
  State<SecuritySettingsView> createState() => _SecuritySettingsViewState();
}

class _SecuritySettingsViewState extends State<SecuritySettingsView> {
  bool walletSwitch = false;
  bool appOpeningSwitch = false;
  bool accountChangingSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: defaultTextColor,
          ),
        ),
        title: const Text(
          'Güvenlik Ayarları',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cüzdan',
                      style: TextStyle(color: systemGreyColor, fontSize: 18),
                    ),
                    Text(
                      'Cüzdana desen/pin/parmak izi ile erişim',
                      style: TextStyle(color: systemGreyColor, fontSize: 14),
                    ),
                  ],
                ),
                Switch(
                  activeColor: defaultTextColor,
                  inactiveTrackColor: const Color(0xFF33373A),
                  inactiveThumbColor: defaultTextColor,
                  activeTrackColor: systemBlueColor,
                  value: walletSwitch,
                  onChanged: (value) {
                    setState(() {
                      walletSwitch = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Uygulama Açılışı',
                      style: TextStyle(color: systemGreyColor, fontSize: 18),
                    ),
                    Text(
                      'Uygulamaya desen/pin/parmak izi ile erişim',
                      style: TextStyle(color: systemGreyColor, fontSize: 14),
                    ),
                  ],
                ),
                Switch(
                  activeColor: defaultTextColor,
                  inactiveTrackColor: const Color(0xFF33373A),
                  inactiveThumbColor: defaultTextColor,
                  activeTrackColor: systemBlueColor,
                  value: appOpeningSwitch,
                  onChanged: (value) {
                    setState(() {
                      appOpeningSwitch = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hesap Değişiklikleri',
                      style: TextStyle(color: systemGreyColor, fontSize: 18),
                    ),
                    Text(
                      'Kullanıcı ayarlarına desen/pin/parmak izi ile erişim',
                      style: TextStyle(color: systemGreyColor, fontSize: 14),
                    ),
                  ],
                ),
                Switch(
                  activeColor: defaultTextColor,
                  inactiveTrackColor: const Color(0xFF33373A),
                  inactiveThumbColor: defaultTextColor,
                  activeTrackColor: systemBlueColor,
                  value: accountChangingSwitch,
                  onChanged: (value) {
                    setState(() {
                      accountChangingSwitch = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
