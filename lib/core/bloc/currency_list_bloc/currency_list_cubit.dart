import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doviz_clone_app/core/models/currency_model/currency_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. State (Durum) sınıfı
class CurrencyListState extends Equatable {

  const CurrencyListState({required this.currencyList});
  final List<Currency> currencyList;

  @override
  List<Object> get props => [currencyList];
}

// 2. Event (Olay) sınıfı
class CurrencyListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// 3. Cubit sınıfı (İş mantığı)
class CurrencyListCubit extends Cubit<CurrencyListState> {
  CurrencyListCubit()
      : super(CurrencyListState(currencyList: List.from(currencies))) {
    _loadCurrencyListData();
  }

  Future<void> _loadCurrencyListData() async {
    final prefs = await SharedPreferences.getInstance();
    final currencyListString = prefs.getString('currencyList');

    if (currencyListString != null) {
      // JSON'dan listeye çevir
      final currencyListJson = jsonDecode(currencyListString) as List<dynamic>;
      final currencyList = currencyListJson
          .map((currency) => Currency.fromJson(currency as Map<String,dynamic>))
          .toList();
      emit(CurrencyListState(currencyList: currencyList));
    } else {
      // Eğer veri yoksa, başlangıç verilerini kullan
      _initializeCurrencyList();
    }
  }

  // Başlangıç verilerini yükle
  void _initializeCurrencyList() {
    final initialList = currencies;
    emit(CurrencyListState(currencyList: initialList));
  }

  // 4. Listeyi güncelleme metodu
  void toggleIsSelected(Currency currency) {
    final updatedCurrencyList = state.currencyList.map((c) {
      if (c.buyPrice == currency.buyPrice &&
          c.currencyImage == currency.currencyImage &&
          c.currencyName == currency.currencyName &&
          c.currencySymbolName == currency.currencySymbolName &&
          c.currencyCategory == currency.currencyCategory &&
          c.sellPrice == currency.sellPrice &&
          c.lastPrice == currency.lastPrice) {
        return Currency(
          currencyName: c.currencyName,
          currencyCategory: c.currencyCategory,
          buyPrice: c.buyPrice,
          currencyImage: c.currencyImage,
          currencySymbolName: c.currencySymbolName,
          lastPrice: c.lastPrice,
          sellPrice: c.sellPrice,
          isSelected: !c.isSelected,
        );
      }
      return c;
    }).toList();

    emit(CurrencyListState(currencyList: updatedCurrencyList));
    _saveCurrencyLisData(updatedCurrencyList); 
  }

  // 5. Listeyi sadece gorunurluk true olanlarla filtreleme
  List<Currency> get selectedCurrencies =>
      state.currencyList.where((c) => c.isSelected).toList();

  Future<void> _saveCurrencyLisData(List<Currency> updatedList) async {
    final prefs = await SharedPreferences.getInstance();
    // Listeyi JSON'a çevir
    final currencyListString = jsonEncode(updatedList.map((e) => e.toJson()).toList());
    await prefs.setString('currencyList', currencyListString);
  }    
}
