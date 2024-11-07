import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class SecuritySettingsView extends StatelessWidget {
  const SecuritySettingsView({super.key});

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
            child: const Icon(Icons.arrow_back_ios,color: defaultTextColor,),),
        title: const Text('Güvenlik Ayarları',style: TextStyle(color: defaultTextColor),),
      ),
      body: const Center(
        child: Text('Güvenlik Ayarları',style: TextStyle(color: defaultTextColor),),
      ),
    );
  }
}
