import 'package:doviz_clone_app/core/bloc/currency_list_bloc/currency_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:doviz_clone_app/core/models/currency_model/currency_model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCategoryMenu extends StatefulWidget {
  const CurrencyCategoryMenu({super.key});

  @override
  State<CurrencyCategoryMenu> createState() => _CurrencyCategoryMenuState();
}

class _CurrencyCategoryMenuState extends State<CurrencyCategoryMenu> {
  TextEditingController currencyController = TextEditingController();

  final Map<String, bool> _expandedCategories = {
    'Döviz': false,
    'Altın': false,
    'Kapalıçarşı&Döviz Büroları': false,
    'Bankalar': false,
    'Kripto Paralar': false,
  };

  late List<Currency> currencyList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: [
          _buildCategoryTile('Döviz', CurrencyCategory.exchange),
          _buildCategoryTile('Altın', CurrencyCategory.gold),
          _buildCategoryTile(
            'Kapalıçarşı&Döviz Büroları',
            CurrencyCategory.grandBazaar,
          ),
          _buildCategoryTile('Bankalar', CurrencyCategory.banks),
          _buildCategoryTile('Kripto Paralar', CurrencyCategory.cryptoMoney),
        ],
      ),
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
            icon: Icon(
              _expandedCategories[title]!
                  ? Icons.arrow_drop_down
                  : Icons.arrow_forward_ios,
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
    return BlocBuilder<CurrencyListCubit, CurrencyListState>(
      builder: (context, state) {
        final filteredList = state.currencyList
            .where((currency) => currency.currencyCategory == category)
            .toList();

        if (filteredList.isEmpty) {
          return const Center(child: Text('Kategoriye ait döviz bulunamadı.'));
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
                          Text(
                            currency.currencyName,
                            style: const TextStyle(
                              color: systemGreyColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (currency.isSelected)
                    const Icon(
                      Icons.check,
                      color: systemGreyColor,
                    ),
                ],
              ),
              onTap: () {
                context.read<CurrencyListCubit>().toggleIsSelected(currency);
              },
            );
          },
        );
      },
    );
  }
}
