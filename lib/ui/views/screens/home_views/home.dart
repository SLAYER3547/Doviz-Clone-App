// ignore_for_file: must_be_immutable
import 'package:doviz_clone_app/core/bloc/currency_list_bloc/home_currency_list_cubit.dart';
import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_bloc.dart';
import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_state.dart';
import 'package:doviz_clone_app/core/functions/main_page_functions.dart';
import 'package:doviz_clone_app/core/models/crypto_model/crypto_model.dart';
import 'package:doviz_clone_app/core/models/crypto_model/most_active_crypto_list_of_day.dart';
import 'package:doviz_clone_app/core/models/crypto_model/most_saved_crypto_list_of_day.dart';
import 'package:doviz_clone_app/core/models/currency_model/home_currency_model.dart';
import 'package:doviz_clone_app/core/models/most_followed_money_list/most_followed_money_list.dart';
import 'package:doviz_clone_app/core/models/onboarding_models/watch_currency_list_model.dart';
import 'package:doviz_clone_app/core/models/rising_exchanges_model/rising_exchanges_model.dart';
import 'package:doviz_clone_app/core/models/rising_exchanges_model/rising_exchanges_of_day_model.dart';
import 'package:doviz_clone_app/core/models/share_model/most_active_share_list_of_day.dart';
import 'package:doviz_clone_app/core/models/share_model/share_model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/auth_views/sign_up_view.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/home_search_view.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/most_active_crypto_list_of_day.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/most_active_share_list_of_day_page.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/most_followed_money_list.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/most_saved_crypto_list_of_day.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/rising_crypto_list_of_week.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/rising_exchanges_list_of_day.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/rising_exchanges_list_of_week.dart';
import 'package:doviz_clone_app/ui/views/screens/home_views/rising_share_list_of_week.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  /*Future<void> settingsProcesses(String selectedSettingsFilter) async {
    if (selectedSettingsFilter == 'Sembol Ekle') {
      await Navigator.push(
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
      showPreferredCurrencyListsBottomSheet(context, preferredCurrencyLists);
    }
  }*/

  List<WatchCurrencyList> currencyList = WatchCurrencyList.currencyList;
  List<CryptoList> cryptoList = CryptoList.cryptoList;
  List<ShareList> shareList = ShareList.shareList;
  final risingExchangesOfWeekList = risingExchangesOfWeek;
  final risingExchangesOfDayList = risingExchangesOfDay;
  final mostSavedCryptoList = MostSavedCryptoListOfDay.mostSavedCryptoListOfDay;
  final mostFollowedMoneys = MostFollowedMoneyList.mostFollowedMoneyList;
  final mostActiveCryptoList =
      MostActiveCryptoListOfDay.mostActiveCryptoListOfDay;
  final mostActiveShareList = MostActiveShareListOfDay.mostActiveShareListOfDay;
  List<HomeCurrency> displayedCurrencies =
      List.from(homeCurrencies.where((e) => e.isSelected == true));
  List<HomeCurrency> editableCurrencyList = [];

  @override
  void initState() {
    super.initState();
    if (displayedCurrencies.isEmpty) return;
    final cubit = context.read<HomeCurrencyListCubit>();
    editableCurrencyList = cubit.state.homeCurrencyList
        .where((currency) => currency.isSelected)
        .toList();
  }

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
          if (!isEditing)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeSearchView(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    color: iconColor,
                  ),
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
                              ListTile(
                                leading: const Icon(
                                  Icons.add,
                                  color: iconColor,
                                ),
                                title: const Text(
                                  'Sembol Ekle',
                                  style: TextStyle(color: defaultTextColor),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeSearchView(),
                                    ),
                                  );
                                  
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.edit,
                                  color: iconColor,
                                ),
                                title: const Text(
                                  'Düzenle',
                                  style: TextStyle(color: defaultTextColor),
                                ),
                                onTap: () {
                                  setState(() {
                                    isEditing = true;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.list,
                                  color: iconColor,
                                ),
                                title: const Text(
                                  'Listeler',
                                  style: TextStyle(color: defaultTextColor),
                                ),
                                onTap: () {
                                  showPreferredCurrencyListsBottomSheet(
                                    context,
                                    preferredCurrencyLists,
                                  );
                                },
                              ),
                              /*ListView.builder(
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
                            ),*/
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
          if (isEditing)
            IconButton(
              icon: const Icon(
                Icons.check,
                color: iconColor,
              ),
              onPressed: () {
                context.read<HomeCurrencyListCubit>().updateListOrder(
                      context
                          .read<HomeCurrencyListCubit>()
                          .state
                          .homeCurrencyList,
                    );
                setState(() {
                  isEditing = false;
                });
              },
            ),
        ],
      ),
      body: BlocBuilder<ListsBloc, ListsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              if (!isEditing)
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
                                orderIcon =
                                    updateOrderIcon(selectedOrderFilter);
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
              BlocBuilder<HomeCurrencyListCubit, HomeCurrencyListState>(
                builder: (context, state) {
                  editableCurrencyList = state.homeCurrencyList
                      .where((currency) => currency.isSelected)
                      .toList();
                  return SliverReorderableList(
                    itemBuilder: (context, index) {
                      final currency = editableCurrencyList[index];
                      return Column(
                        key: ValueKey(
                          currency.currencyName,
                        ),
                        children: [
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isEditing)
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: systemGreyColor,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<HomeCurrencyListCubit>()
                                          .hideCurrency(currency);
                                    },
                                  ),
                                /*ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    currency.currencyImage,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),*/
                              ],
                            ),
                            title: isEditing
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currency.currencySymbolName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        currency.currencyName,
                                        style: const TextStyle(
                                          color: systemGreyColor,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currency.currencySymbolName,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    10 *
                                                    3.5,
                                                child: Text(
                                                  currency.currencyName,
                                                  style: const TextStyle(
                                                    color: systemGreyColor,
                                                    fontSize: 14,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const Text(
                                                ' . 09.33',
                                                style: TextStyle(
                                                  color: systemGreyColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10 *
                                                1.5,
                                            child: Text(
                                              currency.sellPrice.toString(),
                                              style: const TextStyle(
                                                color: defaultTextColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                currency.buyPrice.toString(),
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(width: 7),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    10 *
                                                    1,
                                                child: Text(
                                                  '%${currency.sellPrice}',
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 12,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                            trailing: isEditing
                                ? const Icon(
                                    Icons.menu,
                                    color: iconColor,
                                  )
                                : null,
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
                    itemCount: editableCurrencyList.length,
                    onReorder: (oldIndex, newIndex) {
                      context
                          .read<HomeCurrencyListCubit>()
                          .reorderCurrencies(oldIndex, newIndex);
                    },
                  );

                  /*return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  editableCurrencyList[index].currencyImage,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        editableCurrencyList[index]
                                            .currencySymbolName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10 *
                                                3.5,
                                            child: Text(
                                              editableCurrencyList[index]
                                                  .currencyName,
                                              style: const TextStyle(
                                                color: systemGreyColor,
                                                fontSize: 14,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Text(
                                            ' . 09.33',
                                            style: TextStyle(
                                              color: systemGreyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10 *
                                                1.5,
                                        child: Text(
                                          editableCurrencyList[index]
                                              .sellPrice
                                              .toString(),
                                          style: const TextStyle(
                                            color: defaultTextColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            editableCurrencyList[index]
                                                .buyPrice
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                10 *
                                                1,
                                            child: Text(
                                              '%${editableCurrencyList[index].sellPrice}',
                                              style: const TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
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
                      childCount: editableCurrencyList.length,
                    ),
                  );*/
                },
              ),
              /*SliverList(
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
                                        style:
                                            TextStyle(color: defaultTextColor),
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
                                        currencyList[index]
                                            .changedValue
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.green,),
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        '%${currencyList[index].changedPercentage}',
                                        style: const TextStyle(
                                            color: Colors.green,),
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
              ),*/
              /*GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeCurrencyList(),),);
                },
                child: const Text(
                  'Aç',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),*/
              if (state.visibleLists[0] && !isEditing)
                _RisingExchangesOfDay(
                  risingExchangesOfDayList: risingExchangesOfDayList,
                ),
              if (state.visibleLists[1] && !isEditing)
                _RisingExchangesOfWeek(
                  risingExchangesOfWeekList: risingExchangesOfWeekList,
                ),
              if (state.visibleLists[2] && !isEditing)
                _MostSavedCrpytoListOfDay(
                  mostSavedCryptoList: mostSavedCryptoList,
                ),
              if (state.visibleLists[3] && !isEditing)
                _RisingCryptoListOfWeek(cryptoList: cryptoList),
              if (state.visibleLists[4] && !isEditing)
                _MostActiveCryptoListOfDay(
                  mostActiveCryptoList: mostActiveCryptoList,
                ),
              if (state.visibleLists[5] && !isEditing)
                _RisingShareListOfWeek(shareList: shareList),
              if (state.visibleLists[6] && !isEditing)
                _MostActiveShareListOfDay(
                  mostActiveShareList: mostActiveShareList,
                ),
              if (state.visibleLists[7] && !isEditing)
                _MostFollowedMoneyList(
                  mostFollowedMoneys: mostFollowedMoneys,
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ListTitleWidget extends StatelessWidget {
  const _ListTitleWidget({
    required this.listTitle,
    required this.listDetailPage,
  });
  final String listTitle;
  final Widget listDetailPage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => listDetailPage,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
        child: Row(
          children: [
            Text(
              listTitle,
              style: const TextStyle(color: defaultTextColor, fontSize: 16),
            ),
            const SizedBox(
              width: 7,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: iconColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _MostFollowedMoneyList extends StatelessWidget {
  const _MostFollowedMoneyList({
    required this.mostFollowedMoneys,
  });

  final List<MostFollowedMoneyList> mostFollowedMoneys;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'En Çok Takip Edilenler',
            listDetailPage: MostFolloweMoneyPage(),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mostFollowedMoneys.length,
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
                        mostFollowedMoneys[index].moneySymbolName,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${mostFollowedMoneys[index].moneyPrice.toStringAsFixed(6)}',
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
                            '%${mostFollowedMoneys[index].changedValuePercentageOfMoney.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${mostFollowedMoneys[index].changedValueOfMoney.toStringAsFixed(2)}',
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
        ],
      ),
    );
  }
}

class _MostActiveShareListOfDay extends StatelessWidget {
  const _MostActiveShareListOfDay({
    required this.mostActiveShareList,
  });

  final List<MostActiveShareListOfDay> mostActiveShareList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Günün En Aktif Hisseleri',
            listDetailPage: MostActiveShareListOfDayPage(),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mostActiveShareList.length,
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
                        mostActiveShareList[index].shareSymbolName,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${mostActiveShareList[index].price.toStringAsFixed(6)}',
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
                            '%${mostActiveShareList[index].changedValuePercentageOfDay.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${mostActiveShareList[index].changedValueOfDay.toStringAsFixed(2)}',
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
        ],
      ),
    );
  }
}

class _RisingShareListOfWeek extends StatelessWidget {
  const _RisingShareListOfWeek({
    required this.shareList,
  });

  final List<ShareList> shareList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Haftanın Yükselen Hisseleri',
            listDetailPage: RisingShareListOfWeek(),
          ),
          SizedBox(
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
        ],
      ),
    );
  }
}

class _MostActiveCryptoListOfDay extends StatelessWidget {
  const _MostActiveCryptoListOfDay({
    required this.mostActiveCryptoList,
  });

  final List<MostActiveCryptoListOfDay> mostActiveCryptoList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Günün En Aktif Kripto Paraları',
            listDetailPage: MostActiveCryptoListOfDayPage(),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mostActiveCryptoList.length,
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
                        mostActiveCryptoList[index].cryptoSymbolName,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${mostActiveCryptoList[index].price.toStringAsFixed(6)}',
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
                            '%${mostActiveCryptoList[index].changedValuePercentageOfDay.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${mostActiveCryptoList[index].changedValueOfDay.toStringAsFixed(2)}',
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
        ],
      ),
    );
  }
}

class _RisingCryptoListOfWeek extends StatelessWidget {
  const _RisingCryptoListOfWeek({
    required this.cryptoList,
  });

  final List<CryptoList> cryptoList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Haftanın Yükselen Kripto Paraları',
            listDetailPage: RisingCryptoListOfWeek(),
          ),
          SizedBox(
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
        ],
      ),
    );
  }
}

class _MostSavedCrpytoListOfDay extends StatelessWidget {
  const _MostSavedCrpytoListOfDay({
    required this.mostSavedCryptoList,
  });

  final List<MostSavedCryptoListOfDay> mostSavedCryptoList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Günün En Çok Kazandıran Kripto Paraları',
            listDetailPage: MostSavedCryptoListOfDayPage(),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mostSavedCryptoList.length,
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
                        mostSavedCryptoList[index].cryptoSymbolName,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${mostSavedCryptoList[index].price.toStringAsFixed(6)}',
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
                            '%${mostSavedCryptoList[index].changedValuePercentageOfDay.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${mostSavedCryptoList[index].changedValueOfDay.toStringAsFixed(2)}',
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
        ],
      ),
    );
  }
}

class _RisingExchangesOfWeek extends StatelessWidget {
  _RisingExchangesOfWeek({
    required this.risingExchangesOfWeekList,
  });

  // ignore: type_annotate_public_apis
  var risingExchangesOfWeekList = risingExchangesOfWeek;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Haftanın Yükselen Dövizleri',
            listDetailPage: RisingExchangesListOfWeek(),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: risingExchangesOfWeekList.length,
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
                        risingExchangesOfWeekList[index].currencyName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${risingExchangesOfWeekList[index].sellPrice.toStringAsFixed(6)}',
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
                            '%${risingExchangesOfWeekList[index].changedPercentageOfWeek.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${risingExchangesOfWeekList[index].changedValueOfDay.toStringAsFixed(2)}',
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
        ],
      ),
    );
  }
}

class _RisingExchangesOfDay extends StatelessWidget {
  _RisingExchangesOfDay({
    required this.risingExchangesOfDayList,
  });

  // ignore: type_annotate_public_apis
  var risingExchangesOfDayList = risingExchangesOfDay;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const _ListTitleWidget(
            listTitle: 'Günün Yükselen Dövizleri',
            listDetailPage: RisingExchangesListOfDay(),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: risingExchangesOfDayList.length,
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
                        risingExchangesOfDayList[index].currencyName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: defaultTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${risingExchangesOfDayList[index].sellPrice.toStringAsFixed(6)}',
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
                            '%${risingExchangesOfDayList[index].changedPercentageOfDay.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '\$${risingExchangesOfDayList[index].changedValueOfDay.toStringAsFixed(2)}',
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
        ],
      ),
    );
  }
}
