import 'package:doviz_clone_app/models/onboarding_models/watch_currency_list_model.dart';
import 'package:doviz_clone_app/views/widgets/onboarding_currency_list.dart';
import 'package:flutter/material.dart';

class FirstOnboardingPage extends StatefulWidget {
  const FirstOnboardingPage({
    super.key,
  });

  @override
  State<FirstOnboardingPage> createState() => _FirstOnboardingPageState();
}

class _FirstOnboardingPageState extends State<FirstOnboardingPage> {
  List<WatchCurrencyList> currencyList = [
    WatchCurrencyList("assets/images/gram_altın.jpeg", "Gram Altın",
        "Gram Altın", true,2937.94,1212.2,70.24),
    WatchCurrencyList(
        "assets/images/united_states_flag.png", "USD", "Amerikan Doları", true,34.2812,6.513,23.46),
    WatchCurrencyList(
        "assets/images/europe_flag.png", "EUR", "Euro", true,37.5022,8.29,28.39),
    WatchCurrencyList(
        "assets/images/bist.png", "XU100", "BIST 100", true,8876.22,545.58,6.55),
    WatchCurrencyList("assets/images/cumhuriyet.jpg",
        "Cumhuriyet Altını", "Cumhuriyet Altını", false,20100,100,12.25),
    WatchCurrencyList("assets/images/ata.png", "Ata Altın",
        "Ata Altın", false,22000,125,11.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset("assets/images/follow_list_boxes.png",
                height: 250)),
        const Text(
          "Takip Listeni Oluştur",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Döviz, altın, kripto para, emtia ve borsa verilerinden anında haberdar olun!",
          style: TextStyle(color: Colors.grey, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              color: Color(0xFF1a202c),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 70,
                height: 10,
                decoration: BoxDecoration(
                    color: const Color(0xFFceced1),
                    borderRadius: BorderRadius.circular(3)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Color(0xFFdee0e2),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Kur, Altın, Kripto Para",
                    style: TextStyle(color: Color(0xFFdee0e2)),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: currencyList.map((currency) {
                  return CurrencyListContainer(
                    currencyImage: currency.currencyImage,
                    currencyName: currency.currencyName,
                    currencySymbolName: currency.currencySymbolName,
                    isFavourited: currency.isFavourited,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
