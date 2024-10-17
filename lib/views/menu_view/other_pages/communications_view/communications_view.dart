import 'package:doviz_clone_app/views/widgets/communication_options_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommunicationsView extends StatelessWidget {
  const CommunicationsView({super.key});

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
        title: const Text("Görüş Bildir",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
           const SizedBox(height: 15,),
           const Center(child: Text("Size nasıl yardımcı olabiliriz?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16))),
           const SizedBox(height: 25,),
           Image.asset("assets/images/communication_page_image.png",),
           const SizedBox(height: 50,),
           CommunicationOptionsBox(boxIcon: FontAwesomeIcons.spider, title: "Bir sorun bildirin", description: "Bir hata mı buldunuz? Bir sorunla mı karşılaştınız? Lütfen bizi haberdar edin."),
           CommunicationOptionsBox(boxIcon: FontAwesomeIcons.lightbulb, title: "Öneride bulunun", description: "Aradığınız hisseyi bulamadınız mı? Yeni bir özellik mi istiyorsunuz? Bizi haberdar edin!"),
           CommunicationOptionsBox(boxIcon: FontAwesomeIcons.circleQuestion, title: "Soru sorun", description: "Bize ne sormak isterseniz?"),
           CommunicationOptionsBox(boxIcon: FontAwesomeIcons.users, title: "Reklam & Partnerlik", description: "Döviz uygulamasında reklam vermek mi istiyorsunuz?"),
        ],
      )
    );
  }
}