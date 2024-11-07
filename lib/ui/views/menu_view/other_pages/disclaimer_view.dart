import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class DisclaimerView extends StatelessWidget {
  const DisclaimerView({super.key});

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
            'Görüş Bildir',
            style: TextStyle(color: defaultTextColor),
          ),
        ),
        body: Container(
          padding:const EdgeInsets.all(15),
          child: const Text(
            "Piyasa verileri Forinvest Yazılım ve Teknolojileri Hizmetleri A.Ş. tarafından sağlanmaktadır. Hisse senedi verileri 15 dakika, Tahvil-Bono-Repo özet verileri 15 dakika gecikmelidir. Burada yer alan yatırım bilgi, yorum ve tavsiyeleri yatırım danışmanlığı kapsamında değildir. Yatırım danışmanlığı hizmeti; aracı kurumlar, portföy yönetim şirketleri, mevduat kabul etmeyen bankalar ile müşteri arasında imzalanacak yatırım danışmanlığı sözleşmesi çerçevesinde sunulmaktadır. Burada yer alan yorum ve tavsiyeler, yorum ve tavsiyede bulunanların kişisel görüşlerine dayanmaktadır. Bu görüşler mali durumunuz ile risk ve getiri tercihlerinize uygun olmayabilir. Bu nedenle, sadece burada yer alan bilgilere dayanılarak yatırım kararı verilmesi beklentilerinize uygun sonuçlar doğurmayabilir. Gerek site üzerindeki, gerekse site için kullanılan kaynaklardaki hata ve eksikliklerden ve sitedeki bilgilerin kullanılması sonucunda yatırımcıların uğrayabilecekleri doğrudan ve/veya dolaylı zararlardan, kar yoksunluğundan, manevi zararlardan ve üçüncü kişilerin uğrayabileceği zararlardan NoktacomMedya İnternet Hizmetleri San. ve Tic. A.Ş hiçbir şekilde sorumlu tutulamaz. BIST isim ve logosu \"Koruma Marka Belgesi\" altında korunmakta olup izinsiz kullanılamaz, iktibas edilemez, değiştirilemez. BIST ismi altında açıklanan tüm bilgilerin telif hakları tamamen BÍST'e ait olup, tekrar yayınlanamaz.",
            style: TextStyle(color: defaultTextColor,fontWeight: FontWeight.w600),
          ),
        ),);
  }
}
