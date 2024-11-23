import 'package:doviz_clone_app/core/functions/main_page_functions.dart';
import 'package:doviz_clone_app/core/models/most_followed_money_list/most_followed_money_list.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MostFolloweMoneyPage extends StatefulWidget {
  const MostFolloweMoneyPage({super.key});

  @override
  State<MostFolloweMoneyPage> createState() => _MostSavedCryptoListOfDayState();
}

class _MostSavedCryptoListOfDayState extends State<MostFolloweMoneyPage> {
  String selectedOrderFilter = 'Varsayılan';
  String selectedPriceTimeStampFilter = 'Günlük';
  final List<String> orderFilterList = [
    'Varsayılan',
    'Alfabetik (A-Z)',
    'Alfabetik (Z-A)',
    'Değere Göre Artan',
    'Değere Göre Azalan',
    'Değişim Oranına Göre Artan',
    'Değişim Oranına Göre Azalan',
  ];
  final List<String> priceTimeStampFilterList = [
    'Günlük',
    'Haftalık',
    'Aylık',
  ];
  final mostFollowedMoneyList = MostFollowedMoneyList.mostFollowedMoneyList;
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
            size: 18,
          ),
        ),
        title: const Center(
          child: Text(
            'En Çok Takip Edilenler',
            style: TextStyle(
              color: iconColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.star,
            color: starIconColor,
            size: 20,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                        });
                      },
                      showIcons: true,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text(
                          selectedOrderFilter,
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.caretDown,
                          color: iconColor,
                          size: 14,
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
                    margin: const EdgeInsets.only(right: 15),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      children: [
                        Text(
                          selectedPriceTimeStampFilter,
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.caretDown,
                          color: iconColor,
                          size: 14,
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
                    GestureDetector(
                      onTap: () {},
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  mostFollowedMoneyList[index].moneySymbolName,
                                  style: const TextStyle(
                                    color: defaultTextColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      10 *
                                      5,
                                  child: Text(
                                    mostFollowedMoneyList[index].moneyName,
                                    style: const TextStyle(
                                      color: systemGreyColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '\$${mostFollowedMoneyList[index].moneyPrice}',
                                  style: const TextStyle(
                                    color: defaultTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${mostFollowedMoneyList[index].changedValueOfMoney}',
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 12,),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '%${mostFollowedMoneyList[index].changedValuePercentageOfMoney}',
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 12,),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 3,
                      color: systemGreyColor,
                      thickness: 0.3,
                      indent: 10,
                      endIndent: 3,
                    ),
                  ],
                );
              },
              childCount: mostFollowedMoneyList.length,
            ),
          ),
        ],
      ),
    );
  }
}
