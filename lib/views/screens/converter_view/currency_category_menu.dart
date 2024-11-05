import 'package:doviz_clone_app/models/currency_model/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyCategoryMenu extends StatefulWidget {

  const CurrencyCategoryMenu({required this.onAddCurrency, super.key});
  final Function(Currency) onAddCurrency;

  @override
  State<CurrencyCategoryMenu> createState() => _CurrencyCategoryMenuState();
}

class _CurrencyCategoryMenuState extends State<CurrencyCategoryMenu> {
  TextEditingController currencyController = TextEditingController();
  // A map to track expanded states of categories
  final Map<String, bool> _expandedCategories = {
    'Döviz': false,
    'Altın': false,
    'Kapalıçarşı&Döviz Büroları': false,
    'Bankalar': false,
    'Kripto Paralar': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
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
                cursorColor: const Color(0xFF185fb9),
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  suffixIcon: currencyController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close_rounded,
                              color: Colors.grey,),
                          onPressed: () {
                            currencyController.clear();
                          },
                        )
                      : null,
                  hintText: 'Kur, Altın, Kripto Para',
                  hintStyle: const TextStyle(color: Colors.white),
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
              'Kapalıçarşı&Döviz Büroları', CurrencyCategory.grandBazaar,),
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
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: Icon(
              _expandedCategories[title]!
                  ? Icons.arrow_drop_down
                  : Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white,
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
        // Show the currency list if the category is expanded
        if (_expandedCategories[title]!) _buildCurrencyList(category),
      ],
    );
  }

  Widget _buildCurrencyList(CurrencyCategory category) {
    final currencyList = currencies
        .where((currency) => currency.currencyCategory == category)
        .toList();

    return ListView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Prevent scrolling of inner list
      itemCount: currencyList.length,
      itemBuilder: (context, index) {
        final currency = currencyList[index];
        return ListTile(
          title: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    currency.currencyImage,
                    width: 30,
                    height: 30,
                  ),),
              const SizedBox(width: 10,),    
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency.currencySymbolName,
                    style: const TextStyle(color: Colors.white,fontSize: 16),
                  ),
                  Text(
                    currency.currencyName,
                    style: const TextStyle(color: Colors.grey,fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            widget.onAddCurrency(currency);
          },
        );
      },
    );
  }

  void showCurrencyList(BuildContext context, List<Currency> currencyList) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: currencyList.length,
          itemBuilder: (context, index) {
            final currency = currencyList[index];
            return ListTile(
              title: Text(
                currency.currencyName,
                style: const TextStyle(color: Colors.white),
              ),
              onTap: () {
                widget.onAddCurrency(currency);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
