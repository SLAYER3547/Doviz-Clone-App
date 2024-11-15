import 'package:doviz_clone_app/core/functions/main_page_functions.dart';
import 'package:doviz_clone_app/core/models/crypto_model/crypto_model.dart';
import 'package:doviz_clone_app/core/models/onboarding_models/watch_currency_list_model.dart';
import 'package:doviz_clone_app/core/models/share_model/share_model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/auth_views/sign_up_view.dart';
import 'package:doviz_clone_app/ui/views/screens/converter_view/currency_category_menu.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/rising_crypto_list_of_week.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/rising_share_list_of_week.dart';
import 'package:flutter/material.dart';

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
  bool isEditing = false;

  final List<String> priceFilterList = ['Alış', 'Satış', 'Son'];
  final List<String> priceTimeStampFilterList = [
    'Günlük',
    'Haftalık',
    'Aylık',
    'Yıllık',
  ];
  final List<String> orderFilterList = [
    'Varsayılan',
    'Alfabetik (A-Z)',
    'Alfabetik (Z-A)',
    'Değişim Oranına Göre Artan',
    'Değişim Oranına Göre Azalan',
  ];

  final List<String> settingList = [
    'Sembol Ekle',
    'Düzenle',
    'Listeler',
  ];

  final List<String> preferredCurrencyLists = [
    'Günün Yükselen Dövizleri',
    'Haftanın Yükselen Dövizleri',
    'Günün En Çok Kazandıran Kripto Paraları',
    'Haftanın Yükselen Kripto Paraları',
    'Günün En Aktif Kripto Paraları',
    'Haftanın Yükselen Hisseleri',
    'Günün En Aktif Hisseleri',
    'En Çok Takip Edilenler',
  ];
  IconData updateSettingsIcon(String selectedSettingsFilter) {
    if (selectedSettingsFilter == 'Sembol Ekle') {
      return Icons.add;
    } else if (selectedSettingsFilter == 'Düzenle') {
      return Icons.edit;
    } else if (selectedSettingsFilter == 'Listeler') {
      return Icons.list;
    } else {
      return Icons.sort;
    }
  }

  void settingsProcesses(String selectedSettingsFilter) {
    if (selectedSettingsFilter == 'Sembol Ekle') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CurrencyCategoryMenu(),
        ),
      );
    } else if (selectedSettingsFilter == 'Düzenle') {
      setState(() {
        isEditing = true;
      });
    } else if (selectedSettingsFilter == 'Listeler') {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: const Color(0xFF1a202c),
        useRootNavigator: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Listeler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: preferredCurrencyLists.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          settingList[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        trailing: const Icon(
                          Icons.star,
                          color: starIconColor,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

  List<WatchCurrencyList> currencyList = WatchCurrencyList.currencyList;
  List<CryptoList> cryptoList = CryptoList.cryptoList;
  List<ShareList> shareList = ShareList.shareList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        title: Image.asset(
          'assets/images/app_logo.jpg',
          width: 80,
          height: 80,
        ),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.search,
                color: iconColor,
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.wallet,
                  color: iconColor,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: const Color(0xFF1a202c),
                    useRootNavigator: true,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 70,
                              height: 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            const Text(
                              'Ayarlar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: settingList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(
                                    updateSettingsIcon(settingList[index]),
                                    color: iconColor,
                                  ),
                                  title: Text(
                                    settingList[index],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    settingsProcesses(settingList[index]);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Icon(
                  Icons.tune_rounded,
                  color: iconColor,
                ),
              ),
            ],
          ),
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
                    'Grafik',
                    style: TextStyle(color: defaultTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPriceFilterBottomSheet(
                      context,
                      'Değer',
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
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        const Icon(
                          Icons.arrow_drop_down_outlined,
                          color: iconColor,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPriceFilterBottomSheet(
                      context,
                      'Fiyat Değişimi',
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
                          color: iconColor,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showPriceFilterBottomSheet(
                      context,
                      'Sıralama',
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
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        Icon(
                          orderIcon ?? Icons.sort,
                          color: iconColor,
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
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    currencyList[index].currencyName,
                                    style: const TextStyle(
                                      color: defaultTextColor,
                                    ),
                                  ),
                                  const Text(
                                    ' . 09.33',
                                    style: TextStyle(color: defaultTextColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                currencyList[index].price.toString(),
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
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
                                    '%${currencyList[index].changedPercentage}',
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: systemGreyColor,
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RisingCryptoListOfWeek(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
                child: const Row(
                  children: [
                    Text(
                      'Haftanın Yükselen Kripto Paraları',
                      style: TextStyle(color: defaultTextColor, fontSize: 16),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: iconColor,
                      size: 16,
                    ),
                  ],
                ),
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
                            color: defaultTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${cryptoList[index].price.toStringAsFixed(6)}',
                          style: const TextStyle(
                            color: defaultTextColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '%${cryptoList[index].changedValuePercentage.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '\$${cryptoList[index].changedValue.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RisingShareListOfWeek(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
                child: const Row(
                  children: [
                    Text(
                      'Haftanın Yükselen Hisseleri',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: iconColor,
                      size: 16,
                    ),
                  ],
                ),
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
                            color: defaultTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${shareList[index].price.toStringAsFixed(6)}',
                          style: const TextStyle(
                            color: defaultTextColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '%${shareList[index].changedValuePercentage.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '\$${shareList[index].changedValue.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
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
