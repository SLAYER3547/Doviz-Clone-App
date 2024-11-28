import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:doviz_clone_app/core/models/currency_model/home_currency_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 1. State (Durum) sınıfı
class HomeCurrencyListState extends Equatable {
  const HomeCurrencyListState({required this.homeCurrencyList});
  final List<HomeCurrency> homeCurrencyList;

  @override
  List<Object> get props => [homeCurrencyList];
}

// 2. Event (Olay) sınıfı
class HomeCurrencyListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// 3. Cubit sınıfı (İş mantığı)
class HomeCurrencyListCubit extends Cubit<HomeCurrencyListState> {
  HomeCurrencyListCubit()
      : super(HomeCurrencyListState(homeCurrencyList: List.from(homeCurrencies))) {
    _loadCurrencyListData();
  }

  Future<void> _loadCurrencyListData() async {
    final prefs = await SharedPreferences.getInstance();
    final homeCurrencyListString = prefs.getString('homeCurrencyList');

    if (homeCurrencyListString != null) {
      // JSON'dan listeye çevir
      final homeCurrencyListJson = jsonDecode(homeCurrencyListString) as List<dynamic>;
      final homeCurrencyList = homeCurrencyListJson
          .map(
              (homeCurrency) => HomeCurrency.fromJson(homeCurrency as Map<String, dynamic>),)
          .toList();
      emit(HomeCurrencyListState(homeCurrencyList: homeCurrencyList));
    } else {
      // Eğer veri yoksa, başlangıç verilerini kullan
      _initializeCurrencyList();
    }
  }

  void updateListOrder(List<HomeCurrency> newList) {
    emit(HomeCurrencyListState(homeCurrencyList: newList));
    _saveCurrencyListData(newList);
  }

  void reorderCurrencies(int oldIndex, int newIndex) {
    final homeCurrencyList = List<HomeCurrency>.from(state.homeCurrencyList);
    // ignore: parameter_assignments
    if (newIndex > oldIndex) newIndex--;
    final currency = homeCurrencyList.removeAt(oldIndex);
    homeCurrencyList.insert(newIndex, currency);

    emit(HomeCurrencyListState(homeCurrencyList: homeCurrencyList));
    _saveCurrencyListData(homeCurrencyList);
  }

  // Öğeyi görünmez yap
  void hideCurrency(HomeCurrency homeCurrency) {
    final updatedHomeCurrencyList = state.homeCurrencyList.map((c) {
      if (c == homeCurrency) {
        return HomeCurrency(
            currencyImage: c.currencyImage,
            currencyName: c.currencyName,
            currencySymbolName: c.currencySymbolName,
            currencyCategory: c.currencyCategory,
            buyPrice: c.buyPrice,
            sellPrice: c.sellPrice,
            lastPrice: c.lastPrice,
            isSelected: false,);
      }
      return c;
    }).toList();
    emit(HomeCurrencyListState(homeCurrencyList: updatedHomeCurrencyList));
    _saveCurrencyListData(updatedHomeCurrencyList);
  }

  // Başlangıç verilerini yükle
  void _initializeCurrencyList() {
    final initialList = homeCurrencies;
    emit(HomeCurrencyListState(homeCurrencyList: initialList));
  }

  // 4. Listeyi güncelleme metodu
  void toggleIsSelected(HomeCurrency homeCurrency) {
    final updatedHomeCurrencyList = state.homeCurrencyList.map((c) {
      if (c.buyPrice == homeCurrency.buyPrice &&
          c.currencyImage == homeCurrency.currencyImage &&
          c.currencyName == homeCurrency.currencyName &&
          c.currencySymbolName == homeCurrency.currencySymbolName &&
          c.currencyCategory == homeCurrency.currencyCategory &&
          c.sellPrice == homeCurrency.sellPrice &&
          c.lastPrice == homeCurrency.lastPrice) {
        return HomeCurrency(
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

    emit(HomeCurrencyListState(homeCurrencyList: updatedHomeCurrencyList));
    _saveCurrencyListData(updatedHomeCurrencyList);
  }

  // 5. Listeyi sadece gorunurluk true olanlarla filtreleme
  List<HomeCurrency> get selectedCurrencies =>
      state.homeCurrencyList.where((c) => c.isSelected).toList();

  Future<void> _saveCurrencyListData(List<HomeCurrency> updatedList) async {
    final prefs = await SharedPreferences.getInstance();
    // Listeyi JSON'a çevir
    final homeCurrencyListString =
        jsonEncode(updatedList.map((e) => e.toJson()).toList());
    await prefs.setString('homeCurrencyList', homeCurrencyListString);
  }
}
