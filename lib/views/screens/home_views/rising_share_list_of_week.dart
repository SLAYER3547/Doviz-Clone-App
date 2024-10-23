import 'package:doviz_clone_app/functions/main_page_functions.dart';
import 'package:doviz_clone_app/models/share_model/share_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RisingShareListOfWeek extends StatefulWidget {
  const RisingShareListOfWeek({super.key});

  @override
  State<RisingShareListOfWeek> createState() => _RisingShareListOfWeekState();
}

class _RisingShareListOfWeekState extends State<RisingShareListOfWeek> {
  String selectedOrderFilter = 'Varsayılan';
  String selectedPriceTimeStampFilter = 'Günlük';
  final List<String> orderFilterList = [
    'Varsayılan',
    'Alfabetik (A-Z)',
    'Alfabetik (Z-A)',
    'Değere Göre Artan',
    'Değere Göre Azalan',
    'Değişim Oranına Göre Artan',
    'Değişim Oranına Göre Azalan'
  ];
  final List<String> priceTimeStampFilterList = [
    'Günlük',
    'Haftalık',
    'Aylık',
  ];
  List<ShareList> shareList = ShareList.shareList;
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
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 18,
            )),
        title: const Center(
            child: Text(
          "Haftanın Yükselen Hisseleri",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
        actions: const [
          Icon(
            Icons.star,
            color: Color(0xFFfe9e12),
            size: 20,
          )
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
                      "Sıralama",
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
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
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
                      "Sıralama",
                      priceTimeStampFilterList,
                      selectedPriceTimeStampFilter,
                      (selected) {
                        setState(() {
                          selectedPriceTimeStampFilter = selected;
                        });
                      },
                      showIcons: false,
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
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
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
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                shareList[index].shareSymbolName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/10*5,
                                child: Text(
                                  shareList[index].shareName,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "\$${shareList[index].price.toString()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$${shareList[index].changedValue.toString()}",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text(
                                    "%${shareList[index].changedValuePercentage.toString()}",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 3,
                      color: Colors.grey,
                      thickness: 0.3,
                      indent: 10,
                      endIndent: 3,
                    ),
                  ],
                );
              },
              childCount: shareList.length,
            ),
          ),
        ],
      ),
    );
  }
}