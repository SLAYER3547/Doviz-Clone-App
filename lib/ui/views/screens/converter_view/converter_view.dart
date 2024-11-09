import 'package:doviz_clone_app/core/bloc/currency_list_bloc/currency_list_cubit.dart';
import 'package:doviz_clone_app/core/models/currency_model/currency_model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/screens/converter_view/currency_category_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String priceType = 'last';
  String printedPriceType = '';
  List<Currency> displayedCurrencies =
      List.from(currencies.where((e) => e.isSelected == true));
  Map<String, TextEditingController> amountControllers = {};
  Map<String, FocusNode> focusNodes = {};
  bool isEditMode = false;
  List<Currency> editableCurrencyList = [];

  @override
  void initState() {
    super.initState();
    initializeControllers();
    final cubit = context.read<CurrencyListCubit>();
    editableCurrencyList = cubit.state.currencyList
        .where((currency) => currency.isSelected)
        .toList();
  }

  void initializeControllers() {
    if (displayedCurrencies.isEmpty) return;

    for (final currency in displayedCurrencies) {
      // ignore: unnecessary_null_comparison
      if (currency.currencyName == null) {
        continue;
      }

      amountControllers[currency.currencyName] =
          TextEditingController(text: '1');
      focusNodes[currency.currencyName] = FocusNode()
        ..addListener(() {
          if (focusNodes[currency.currencyName]?.hasFocus ?? false) {
            amountControllers[currency.currencyName]?.text = '1';
            updateAllCurrencies(currency.currencyName, 1);
          }
        });
    }
  }

  void updatePriceType(String type) {
    setState(() {
      priceType = type;
    });
    _updateAllValues();
  }

  void addCurrency(Currency currency) {
    setState(() {
      displayedCurrencies.add(currency);
      amountControllers.putIfAbsent(
        currency.currencyName,
        () => TextEditingController(text: '1'),
      );
      focusNodes.putIfAbsent(currency.currencyName, FocusNode.new);
      updateAllCurrencies(currency.currencyName, 1);
    });
  }

  void openAddCurrencyMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CurrencyCategoryMenu(),
      ),
    );
  }

  String printTypeText(String type) {
    switch (type) {
      case 'buy':
        printedPriceType = 'Alış';
        return printedPriceType;
      case 'sell':
        printedPriceType = 'Satış';
        return printedPriceType;
      case 'last':
        printedPriceType = 'Son';
        return printedPriceType;
      default:
        return printedPriceType;
    }
  }

  void updateAllCurrencies(String currencyName, double amount) {
    setState(() {
      amountControllers[currencyName]?.text = amount.toStringAsFixed(0);
      for (final currency in displayedCurrencies) {
        if (currency.currencyName != currencyName) {
          final convertedAmount = (amount *
                  currencies
                      .firstWhere((c) => c.currencyName == currencyName)
                      .getPrice(priceType)) /
              currency.getPrice(priceType);
          amountControllers[currency.currencyName]?.text =
              convertedAmount.toStringAsFixed(4);
        }
      }
    });
  }

  void _updateAllValues() {
    if (displayedCurrencies.isNotEmpty) {
      final baseCurrency = displayedCurrencies[0];
      final baseAmount = double.tryParse(
            amountControllers[baseCurrency.currencyName]?.text ?? '1',
          ) ??
          1;
      updateAllCurrencies(baseCurrency.currencyName, baseAmount);
    }
  }

  @override
  void dispose() {
    for (final controller in amountControllers.values) {
      controller.dispose();
    }
    for (final node in focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        title: const Text(
          'Çevirici',
          style: TextStyle(color: defaultTextColor),
        ),
        actions: [
          if (isEditMode)
            IconButton(
              icon: const Icon(
                Icons.check,
                color: iconColor,
              ),
              onPressed: () {
                // Save edits and exit edit mode
                setState(() {
                  isEditMode = false;
                });
              },
            )
          else ...[
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: iconColor),
              onPressed: () {
                setState(() {
                  isEditMode = true;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add, color: iconColor),
              onPressed: openAddCurrencyMenu,
            ),
          ],
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: ['buy', 'sell', 'last'].map((type) {
                      final isSelected = priceType == type;
                      final buttonText = printTypeText(type);
                      return GestureDetector(
                        onTap: () {
                          updatePriceType(type);
                          printTypeText(type);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF238cfe)
                                : const Color(0xFF282828),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              color: isSelected
                                  ? defaultTextColor
                                  : systemGreyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<CurrencyListCubit, CurrencyListState>(
              builder: (context, state) {
                editableCurrencyList = state.currencyList
                    .where((currency) => currency.isSelected)
                    .toList();
                return isEditMode
                    ? ReorderableListView(
                        children: editableCurrencyList.map((currency) {
                          return ListTile(
                            key: ValueKey(currency),
                            title: Container(
                              decoration: BoxDecoration(
                                color: systemMainGreyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.menu,
                                        color: iconColor,
                                      ),
                                      const SizedBox(width: 15),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          currency.currencyImage,
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currency.currencySymbolName,
                                            style: const TextStyle(
                                              color: defaultTextColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: Text(
                                              currency.currencyName,
                                              style: const TextStyle(
                                                color: systemGreyColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: iconColor,
                                    ),
                                    onPressed: () {
                                      // Make the item invisible
                                      context
                                          .read<CurrencyListCubit>()
                                          .hideCurrency(currency);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        onReorder: (oldIndex, newIndex) {
                          context
                              .read<CurrencyListCubit>()
                              .reorderCurrencies(oldIndex, newIndex);
                        },
                      )
                    : ListView.builder(
                        itemCount: state.currencyList
                            .where((c) => c.isSelected)
                            .length,
                        itemBuilder: (context, index) {
                          final currency = state.currencyList
                              .where((c) => c.isSelected)
                              .toList()[index];
                          final focusNode = focusNodes[currency.currencyName];

                          return ListTile(
                            title: Container(
                              decoration: BoxDecoration(
                                color: systemMainGreyColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          currency.currencyImage,
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            currency.currencySymbolName,
                                            style: const TextStyle(
                                              color: defaultTextColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: Text(
                                              currency.currencyName,
                                              style: const TextStyle(
                                                color: systemGreyColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: TextField(
                                      controller: amountControllers[
                                          currency.currencyName],
                                      focusNode: focusNode,
                                      decoration: const InputDecoration(
                                        hintText: 'Miktar',
                                        hintStyle:
                                            TextStyle(color: defaultTextColor),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                          color: defaultTextColor,),
                                      textAlign: TextAlign.right,
                                      onTap: () {
                                        if (amountControllers[
                                                    currency.currencyName]
                                                ?.text
                                                .isEmpty ??
                                            true) {
                                          amountControllers[
                                                  currency.currencyName]
                                              ?.text = '1';
                                          updateAllCurrencies(
                                            currency.currencyName,
                                            1,
                                          );
                                        }
                                      },
                                      onChanged: (value) {
                                        if (value.isEmpty) {
                                          amountControllers[
                                                  currency.currencyName]
                                              ?.text = '0';
                                          updateAllCurrencies(
                                            currency.currencyName,
                                            0,
                                          );
                                        } else {
                                          final amount =
                                              double.tryParse(value) ?? 1;
                                          updateAllCurrencies(
                                            currency.currencyName,
                                            amount,
                                          );
                                        }
                                      },
                                      onEditingComplete: () {
                                        focusNode?.unfocus();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
          GestureDetector(
            onTap: openAddCurrencyMenu,
            child: Container(
              width: MediaQuery.of(context).size.width / 10 * 9.2,
              padding: const EdgeInsets.symmetric(
                vertical: 13,
              ),
              decoration: BoxDecoration(
                color: systemMainGreyColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: iconColor),
                  Text(
                    'Sembol Ekle',
                    style: TextStyle(
                      color: defaultTextColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
