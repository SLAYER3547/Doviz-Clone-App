import 'package:flutter/material.dart';

class SecondOnboardingPage extends StatelessWidget {


  const SecondOnboardingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/notification.png", height: 300), // Görsel
        const SizedBox(height: 20),
        const Text("Bildirimleri Aç",style: TextStyle(color: Colors.white, fontSize: 30),),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Piyasalarla ilgili en önemli gelişmelerden ilk senin haberin olsun! Bildirimleri istediğin zaman kapatabileceksin.",
          style: TextStyle(color: Colors.grey, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30,),
        Container(
          decoration: BoxDecoration(color: const Color(0xFF1e2430),borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width/10*8,
          padding: const EdgeInsets.all(15),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.notifications_none,color: Colors.white,),
              SizedBox(width: 10,),
              Text("Bildirimlere İzin Ver",style: TextStyle(color: Colors.white,fontSize: 18),)
            ],
          ),
        )
        
      ],
    );
  }
}