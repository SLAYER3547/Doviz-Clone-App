import 'package:doviz_clone_app/models/crypto_model/crypto_model.dart';
import 'package:doviz_clone_app/models/share_model/share_model.dart';
import 'package:flutter/material.dart';
import 'package:doviz_clone_app/models/onboarding_models/watch_currency_list_model.dart';
import 'package:doviz_clone_app/functions/main_page_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPriceFilter = 'Satış';
  String selectedPriceTimeStampFilter = 'Yıllık';
  String selectedOrderFilter = 'Varsayılan';
  IconData? orderIcon;

  final List<String> priceFilterList = ['Alış', 'Satış', 'Son'];
  final List<String> priceTimeStampFilterList = [
    'Günlük',
    'Haftalık',
    'Aylık',
    'Yıllık'
  ];
  final List<String> orderFilterList = [
    'Varsayılan',
    'Alfabetik (A-Z)',
    'Alfabetik (Z-A)',
    'Değişim Oranına Göre Artan',
    'Değişim Oranına Göre Azalan'
  ];

  List<WatchCurrencyList> currencyList = [
    WatchCurrencyList("assets/images/gram_altın.jpeg", "Gram Altın",
        "Gram Altın", true, 2937.94, 1212.2, 70.24),
    WatchCurrencyList("assets/images/united_states_flag.png", "USD",
        "Amerikan Doları", true, 34.2812, 6.513, 23.46),
    WatchCurrencyList("assets/images/europe_flag.png", "EUR", "Euro", true,
        37.5022, 8.29, 28.39),
    WatchCurrencyList("assets/images/bist.png", "XU100", "BIST 100", true,
        8876.22, 545.58, 6.55),

  ];

  List<CryptoList> cryptoList = [
    CryptoList("TRUMP", "MOG TRUMP", 0.170764, 0.07, 74.42),
    CryptoList("SIGMA", "Sigma", 0.084608, 0.01, 10.02),
    CryptoList("BTCP", "Bitcoin Pro", 33.07, 4.11, 14.20),
    CryptoList("SILLY", "Silly Dragon", 0.02269212, 0.00, 1.66),
    CryptoList("NETVR", "Netvrk", 0.12449, 0.01, -9.41),
    CryptoList("SPX", "SPX6900", 0.829085, 0.10, -10.47),
    CryptoList("RETARDIO", "RETARDIO", 0.166572, -0.02, -11.65),
    CryptoList(
        "BITCOIN", "HarryPotterObamaSonic10lnu(ETH)", 0.308778, -0.04, -10.95),
    CryptoList("APU", "Apu Apustaja", 0.00087959, -0.00, -2.25),
    CryptoList("SLERF", "Slerf", 0.246344, -0.05, 26.33),
  ];

  List<ShareList> shareList = [
    ShareList("SKTAS", "SOKTAS", 4.95, 0.45, 10.00),
    ShareList("TKFEN", "TEKFEN HOLDING", 63.95, 0.90, 1.91),
    ShareList("SOKE", "SOKE DEGIRMENCILIK", 13.77, 0.67, 5.11),
    ShareList("MARKA", "MARKA YATIRIM HOLDING", 51.40, 4.66, 9.97),
    ShareList("IZFAS", "IZMIR FIRCA", 42.32, 0.24, 0.57),
    ShareList("ICUGS", "ICU GIRISIM", 26.16, -0.10, -0.38),
    ShareList("ULUUN", "ULUSOY UN SANAYI", 6.49, 0.21, 3.34),
    ShareList("SAFKR", "SAFKAR EGE SOGUTMACILIK", 58.95, 0.75, 1.29),
    ShareList("DURDO", "DURAN DOGAN BASIM", 15.72, -1.20, -7.09),
    ShareList("TUREX", "TUREX TURIZM TASIMACILIK", 103.90, 1.60, 1.56),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/images/app_logo.jpg",
          width: 80,
          height: 80,
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.wallet,
                color: Colors.white,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.tune_rounded,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 60,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xFF172e3d),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Grafik",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPriceFilterBottomSheet(
                      context,
                      "Değer",
                      priceFilterList,
                      selectedPriceFilter,
                      (selected) {
                        setState(() {
                          selectedPriceFilter = selected;
                        });
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: 70,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF172e3d),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedPriceFilter,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPriceFilterBottomSheet(
                      context,
                      "Fiyat Değişimi",
                      priceTimeStampFilterList,
                      selectedPriceTimeStampFilter,
                      (selected) {
                        setState(() {
                          selectedPriceTimeStampFilter = selected;
                        });
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: 90,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF172e3d),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedPriceTimeStampFilter,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPriceFilterBottomSheet(
                      context,
                      "Sıralama",
                      orderFilterList,
                      selectedOrderFilter,
                      (selected) {
                        setState(() {
                          selectedOrderFilter = selected;
                          orderIcon = updateOrderIcon(selectedOrderFilter);
                        });
                      },
                      showIcons: true,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: 110,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF172e3d),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getOrderText(selectedOrderFilter),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Icon(
                          orderIcon ?? Icons.sort,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          currencyList[index].currencyImage,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currencyList[index].currencySymbolName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Text(currencyList[index].currencyName,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  const Text(
                                    " . 09.33",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                currencyList[index].price.toString(),
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    currencyList[index].changedValue.toString(),
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "%${currencyList[index].changedPercentage}",
                                    style: const TextStyle(color: Colors.green),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 15,
                      endIndent: 15,
                    ),
                  ],
                );
              },
              childCount: currencyList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
              child: const Row(
                children: [
                  Text(
                    "Haftanın Yükselen Kripto Paraları",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cryptoList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xf222222d),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cryptoList[index].cryptoSymbolName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${cryptoList[index].price.toStringAsFixed(6)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "%${cryptoList[index].changedValuePercentage.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "\$${cryptoList[index].changedValue.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
              child: const Row(
                children: [
                  Text(
                    "Haftanın Yükselen Hisseleri",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shareList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xf222222d),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shareList[index].shareSymbolName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${shareList[index].price.toStringAsFixed(6)}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "%${shareList[index].changedValuePercentage.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "\$${shareList[index].changedValue.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
