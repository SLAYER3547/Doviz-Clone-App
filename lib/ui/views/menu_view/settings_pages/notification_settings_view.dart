import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({super.key});

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
              color: iconColor,
            ),),
        title: const Text(
          'Bildirim Ayarları',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: const Center(
        child: Text(
          'Bildirimler',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
    );
  }
}
