import 'package:doviz_clone_app/core/functions/main_page_functions.dart';
import 'package:doviz_clone_app/core/models/crypto_model/crypto_model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/crypto_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RisingCryptoListOfWeek extends StatefulWidget {
  const RisingCryptoListOfWeek({super.key});

  @override
  State<RisingCryptoListOfWeek> createState() => _RisingCryptoListOfWeekState();
}

class _RisingCryptoListOfWeekState extends State<RisingCryptoListOfWeek> {
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
  List<CryptoList> cryptoList = CryptoList.cryptoList;
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
            ),),
        title: const Center(
            child: Text(
          'Haftanın Yükselen Kripto Paraları',
          style: TextStyle(
              color: iconColor, fontSize: 18, fontWeight: FontWeight.bold,),
        ),),
        actions: const [
          Icon(
            Icons.star,
            color: Color(0xFFfe9e12),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CryptoDetailView(
                                    cryptoImage: cryptoList[index].cryptoImage,
                                    cryptoSymbolName:
                                        cryptoList[index].cryptoSymbolName,
                                    cryptoName: cryptoList[index].cryptoName,
                                    cryptoPrice: cryptoList[index].price,
                                    cryptoValueForTl:
                                        cryptoList[index].cryptoValueForTl,
                                    changePercentageOfWeek: cryptoList[index]
                                        .changePercentageOfWeek,
                                    changePercentageOfMonth: cryptoList[index]
                                        .changePercentageOfMonth,
                                    changePercentageOfYear: cryptoList[index]
                                        .changePercentageOfYear,
                                    fundSize: cryptoList[index].fundSize,
                                    maximumValueOf52Week:
                                        cryptoList[index].maximumValueOf52Week,
                                    marketValue: cryptoList[index].marketValue,
                                    changedPercentage: cryptoList[index]
                                        .changedValuePercentage,
                                    changedValue:
                                        cryptoList[index].changedValue,),),);
                      },
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cryptoList[index].cryptoSymbolName,
                                  style: const TextStyle(
                                      color: defaultTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      10 *
                                      5,
                                  child: Text(
                                    cryptoList[index].cryptoName,
                                    style: const TextStyle(
                                        color: systemGreyColor,
                                        fontWeight: FontWeight.w500,),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '\$${cryptoList[index].price}',
                                  style: const TextStyle(
                                      color: defaultTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$${cryptoList[index].changedValue}',
                                      style:
                                          const TextStyle(color: Colors.green),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '%${cryptoList[index].changedValuePercentage}',
                                      style:
                                          const TextStyle(color: Colors.green),
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
              childCount: cryptoList.length,
            ),
          ),
        ],
      ),
    );
  }
}
