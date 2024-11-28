import 'package:doviz_clone_app/core/bloc/currency_list_bloc/home_currency_list_cubit.dart';
import 'package:doviz_clone_app/core/models/currency_model/home_currency_model.dart';
import 'package:flutter/material.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchView extends StatefulWidget {
  const HomeSearchView({super.key});

  @override
  State<HomeSearchView> createState() => _HomeSearchViewState();
}

class _HomeSearchViewState extends State<HomeSearchView> {
  TextEditingController currencyController = TextEditingController();

  final Map<String, bool> _expandedCategories = {
    'Döviz': false,
    'Altın': false,
    'Kapalıçarşı&Döviz Büroları': false,
    'Bankalar': false,
    'Hisse Senedi': false,
    'Borsa Yatırım Fonu': false,
    'Borsa Endeksleri': false,
    'Kripto Paralar': false,
    'Pariteler': false,
    'Emtia': false,
    'Tahviller': false,
    'Diğer': false,
  };

  late List<HomeCurrency> currencyList;

  @override
  void initState() {
    super.initState();

    // TextField değişikliklerini dinlemek için listener ekleniyor
    currencyController.addListener(() {
      setState(() {}); // Her değişiklikte UI'yi günceller
    });
  }

  @override
  void dispose() {
    // TextEditingController temizleniyor
    currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = currencyController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: iconColor,
                size: 24,
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 10 * 8,
              decoration: BoxDecoration(
                color: const Color(0xFF1a202c),
                borderRadius: BorderRadius.circular(7),
              ),
              child: TextField(
                controller: currencyController,
                cursorColor: systemBlueColor,
                style: const TextStyle(color: defaultTextColor),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: defaultTextColor),
                  suffixIcon: currencyController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: systemGreyColor,
                          ),
                          onPressed: () {
                            currencyController.clear();
                          },
                        )
                      : null,
                  hintText: 'Kur, Altın, Kripto Para',
                  hintStyle: const TextStyle(color: defaultTextColor),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      body: isSearching ? _buildSearchResults() : _buildNormalView(),
    );
  }

  Widget _buildNormalView() {
    return ListView(
      children: [
        _buildCategoryTile('Döviz', CurrencyCategory.exchange),
        _buildCategoryTile('Altın', CurrencyCategory.gold),
        _buildCategoryTile(
          'Kapalıçarşı&Döviz Büroları',
          CurrencyCategory.grandBazaar,
        ),
        _buildCategoryTile('Bankalar', CurrencyCategory.banks),
        _buildCategoryTile('Hisse Senedi', CurrencyCategory.share),
        _buildCategoryTile(
          'Borsa Yatırım Fonu',
          CurrencyCategory.exchangeTradedFund,
        ),
        _buildCategoryTile('Borsa Endeksleri', CurrencyCategory.stockIndexes),
        _buildCategoryTile('Kripto Paralar', CurrencyCategory.cryptoMoney),
        _buildCategoryTile('Pariteler', CurrencyCategory.parity),
        _buildCategoryTile('Emtia', CurrencyCategory.commodity),
        _buildCategoryTile('Tahviller', CurrencyCategory.bond),
        _buildCategoryTile('Diğer', CurrencyCategory.other),
      ],
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<HomeCurrencyListCubit, HomeCurrencyListState>(
      builder: (context, state) {
        final query = currencyController.text.toLowerCase();
        final filteredList = state.homeCurrencyList.where((currency) {
          return currency.currencyName.toLowerCase().contains(query) ||
              currency.currencySymbolName.toLowerCase().contains(query);
        }).toList();

        if (filteredList.isEmpty) {
          return const SizedBox();
        }

        return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            final currency = filteredList[index];
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          currency.currencyImage,
                          width: 30,
                          height: 30,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              color: systemGreyColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currency.currencySymbolName,
                            style: const TextStyle(
                              color: defaultTextColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10 * 6.7,
                            child: Text(
                              currency.currencyName,
                              style: const TextStyle(
                                color: systemGreyColor,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: IconButton(
                      icon: Icon(
                        currency.isSelected
                            ? Icons.star
                            : Icons.star_border, // Duruma bağlı ikon
                        color: starIconColor,
                        size: 28,
                      ),
                      onPressed: () {
                        context
                            .read<HomeCurrencyListCubit>()
                            .toggleIsSelected(currency);
                      },
                    ),
                  ),
                ],
              ),
              onTap: () {
                context
                    .read<HomeCurrencyListCubit>()
                    .toggleIsSelected(currency);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildCategoryTile(String title, CurrencyCategory category) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(color: defaultTextColor),
          ),
          trailing: IconButton(
            icon: _expandedCategories[title]!
                ? const Icon(
                    Icons.expand_more,
                    size: 27,
                    color: iconColor,
                  )
                : const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: iconColor,
                  ),
            onPressed: () {
              setState(() {
                _expandedCategories[title] = !_expandedCategories[title]!;
              });
            },
          ),
          onTap: () {
            setState(() {
              _expandedCategories[title] = !_expandedCategories[title]!;
            });
          },
        ),
        if (_expandedCategories[title]!) _buildCurrencyList(category),
      ],
    );
  }

  Widget _buildCurrencyList(CurrencyCategory category) {
    return BlocBuilder<HomeCurrencyListCubit, HomeCurrencyListState>(
      builder: (context, state) {
        final filteredList = state.homeCurrencyList
            .where((currency) => currency.currencyCategory == category)
            .toList();

        if (filteredList.isEmpty) {
          return const SizedBox();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            final currency = filteredList[index];
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          currency.currencyImage,
                          width: 30,
                          height: 30,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported,
                              color: systemGreyColor,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currency.currencySymbolName,
                            style: const TextStyle(
                              color: defaultTextColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10 * 6.7,
                            child: Text(
                              currency.currencyName,
                              style: const TextStyle(
                                color: systemGreyColor,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3),
                    child: IconButton(
                      icon: Icon(
                        currency.isSelected
                            ? Icons.star
                            : Icons.star_border, // Duruma bağlı ikon
                        color: starIconColor,
                        size: 28,
                      ),
                      onPressed: () {
                        context
                            .read<HomeCurrencyListCubit>()
                            .toggleIsSelected(currency);
                      },
                    ),
                  ),
                ],
              ),
              onTap: () {
                context
                    .read<HomeCurrencyListCubit>()
                    .toggleIsSelected(currency);
              },
            );
          },
        );
      },
    );
  }
}
