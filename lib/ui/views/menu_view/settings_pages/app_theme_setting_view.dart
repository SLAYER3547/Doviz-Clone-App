import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class AppThemeSettingView extends StatelessWidget {
  const AppThemeSettingView({super.key});

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
          'Görünüm Ayarları',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: const Center(
        child: Text(
          'Görünüm',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
    );
  }
}
