import 'package:flutter/material.dart';

class SecuritySettingsView extends StatelessWidget {
  const SecuritySettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,),),
        title: const Text('Güvenlik Ayarları',style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Text('Güvenlik Ayarları',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
