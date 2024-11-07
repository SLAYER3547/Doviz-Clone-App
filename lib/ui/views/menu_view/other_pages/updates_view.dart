import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class UpdatesView extends StatelessWidget {
  const UpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: iconColor,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            const Text(
              'Yenilikler',
              style: TextStyle(color: defaultTextColor),
            ),
          ],
        ),
        
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildTimelineItem(
            context,
            '17 Temmuz 2024',
            'Yenilikleri Keşfedin',
            [
              'Döviz, Altın ve Hisseler için yeni filtrelemeleri keşfedebilirsiniz.',
              'Tüm bildirimleri artık tek bir sayfadan görebilirsiniz.',
              'İletişim sayfasından artık dilediğiniz gibi detaylı feedback verebilirsiniz.',
              'Cüzdanınızı analiz ederek kazandıran ve kaybettiren varlıklarınızı görebilirsiniz.',
              'Widget sorunları giderildi.',
            ],
          ),
          buildTimelineItem(
            context,
            '24 Mayıs 2024',
            'Cüzdan herkes için yenilendi!',
            [
              'Artık farklı varlık cinsleriyle dilediğiniz sayıda cüzdan oluşturabilirsiniz',
              'Banka varlıklarını yatırımlarınıza dahil edebilirsiniz',
              'Yeni bir yatırım eklerken veya çıkarırken mevcut TRY varlıklarınızdan kullanabilirsiniz',
              'Cüzdanınızı analiz ederek kazandıran ve kaybettiren varlıklarınızı görebilirsiniz',
              'Varlıklarınızın ederini dolar veya TRY bazlı görüntüleyebilirsiniz',
              'Filtreleme ve sıralama işlemleri ile tüm bilgilerinize dilediğiniz şekilde erişebilirsiniz',
              '3 farklı grafik metoduyla kazandıran-kaybettiren varlıklarınızı analiz edebilirsiniz',
              'Üye girişi yaparak cüzdanı ücretsiz kullanmaya başla.',
            ],
          ),
          buildTimelineItem(
            context,
            '30 Ocak 2024',
            'Üyelik avantajlarından yararlanın',
            [
              'Üyelik açmak artık çok kolay! Google, Apple ve E-Posta yöntemleriyle kolayca üye olabilirsiniz',
              'Hesabınızdaki verilerinizi ve premium üyeliğinizi birden fazla Android cihazda güvenli bir şekilde eş zamanlı olarak yönetebilirsiniz',
              'Hesabınıza farklı giriş yöntemlerini ekleyerek dilediğiniz seçenek ile kolayca hesabınıza erişebilirsiniz',
              'Yeni menü sayfamızla ihtiyaç duyduğunuz tüm sayfalar artık tek bir yerde.',
              'Biyometrik doğrulama ile uygulama açılışını ve hesap ayarlarını kontrolünüz altında tutun.',
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimelineItem(
    BuildContext context,
    String date,
    String title,
    List<String> details,
  ) {
    return Stack(
      children: [
        Positioned(
          left: 4.5,
          top: 0,
          bottom: 0,
          child: Container(
            width: 2,
            color: timeLineVerticalLineColor,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: timeLineBlueColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.only(left: 18),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: defaultTextColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ...details.map(
              (detail) => Container(
                margin: const EdgeInsets.only(left: 18),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '• $detail',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ],
    );
  }
}
