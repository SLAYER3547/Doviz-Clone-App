import 'package:flutter/material.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({super.key});

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
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: const Text("Bildirim Ayarları",style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        child: Text("Bildirimler",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}