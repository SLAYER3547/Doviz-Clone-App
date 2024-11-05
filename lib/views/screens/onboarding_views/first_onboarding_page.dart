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
  List<WatchCurrencyList> currencyList =
      WatchCurrencyList.onboardingCurrencyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset('assets/images/follow_list_boxes.png',
                height: 250,),),
        const Text(
          'Takip Listeni Oluştur',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          'Döviz, altın, kripto para, emtia ve borsa verilerinden anında haberdar olun!',
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
                  topLeft: Radius.circular(10), topRight: Radius.circular(10),),),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 70,
                height: 10,
                decoration: BoxDecoration(
                    color: const Color(0xFFceced1),
                    borderRadius: BorderRadius.circular(3),),
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
                    'Kur, Altın, Kripto Para',
                    style: TextStyle(color: Color(0xFFdee0e2)),
                  ),
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
