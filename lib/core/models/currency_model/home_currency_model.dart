enum CurrencyCategory {
  exchange,
  gold,
  grandBazaar,
  banks,
  share,
  exchangeTradedFund,
  stockIndexes,
  cryptoMoney,
  parity,
  commodity,
  bond,
  other
}

class HomeCurrency {
  HomeCurrency({
    required this.currencyImage,
    required this.currencyName,
    required this.currencySymbolName,
    required this.currencyCategory,
    required this.buyPrice,
    required this.sellPrice,
    required this.lastPrice,
    this.isSelected = true,
  });

  // JSON'dan Currency nesnesi oluşturma
  factory HomeCurrency.fromJson(Map<String, dynamic> json) {
    return HomeCurrency(
      currencyImage: json['currencyImage'].toString(),
      currencyName: json['currencyName'].toString(),
      currencySymbolName: json['currencySymbolName'].toString(),
      currencyCategory:
          _currencyCategoryFromString(json['currencyCategory'].toString()),
      buyPrice: json['buyPrice'] as double,
      sellPrice: json['sellPrice'] as double,
      lastPrice: json['lastPrice'] as double,
      isSelected: json['isSelected'] as bool,
    );
  }

  final String currencyImage;
  final String currencyName;
  final String currencySymbolName;
  CurrencyCategory currencyCategory;
  double buyPrice;
  double sellPrice;
  double lastPrice;
  bool isSelected;

  // Para fiyatını döndüren fonksiyon
  double getPrice(String type) {
    switch (type) {
      case 'buy':
        return buyPrice;
      case 'sell':
        return sellPrice;
      case 'last':
        return lastPrice;
      default:
        return lastPrice;
    }
  }

  // JSON'dan gelen string değeri enum'a çevirme
  static CurrencyCategory _currencyCategoryFromString(String category) {
    return CurrencyCategory.values.firstWhere(
      (e) => e.toString().split('.').last == category,
      orElse: () => CurrencyCategory.exchange, // Varsayılan değer
    );
  }

  // Currency nesnesini JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      'currencyImage': currencyImage,
      'currencyName': currencyName,
      'currencySymbolName': currencySymbolName,
      'currencyCategory':
          currencyCategory.toString().split('.').last, // Enum'u string'e çevir
      'buyPrice': buyPrice,
      'sellPrice': sellPrice,
      'lastPrice': lastPrice,
      'isSelected': isSelected,
    };
  }
}

List<HomeCurrency> homeCurrencies = [
  HomeCurrency(
    currencyImage:
        'https://seeklogo.com/images/T/turkiye-yuvarlak-logo-6483C54DD8-seeklogo.com.png',
    currencyName: 'Türk Lirası',
    currencySymbolName: 'TL',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 1,
    sellPrice: 1,
    lastPrice: 1,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Amerikan Doları',
    currencySymbolName: 'USD',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  HomeCurrency(
    currencyImage:
        'https://ideacdn.net/shop/zr/79/myassets/products/866/avrupa-bayragi-ab.jpg?revision=1712609888',
    currencyName: 'Euro',
    currencySymbolName: 'EUR',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 37.0585,
    sellPrice: 37.0716,
    lastPrice: 37.0716,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'İngiliz Sterlini',
    currencySymbolName: 'GBP',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'İsviçre Frangı',
    currencySymbolName: 'CHF',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Kanada Doları',
    currencySymbolName: 'CAD',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  HomeCurrency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Rus Rublesi',
    currencySymbolName: 'RUB',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'BAE Dirhemi',
    currencySymbolName: 'AED',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Avustralya Doları',
    currencySymbolName: 'AUD',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  HomeCurrency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMD7mUigrxGB7pF8MTxdTQGr2qwLLjUlFj9Q&s',
    currencyName: 'Danimarka Kronu',
    currencySymbolName: 'DKK',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://bigpara.hurriyet.com.tr/Assets/images/altin_icon.jpg',
    currencyName: 'Ons Altın',
    currencySymbolName: 'Ons Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Gram Altın',
    currencySymbolName: 'Gram Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Gram Has Altın',
    currencySymbolName: 'Gram Has Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 3013.91,
    sellPrice: 3014.56,
    lastPrice: 3014.56,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Çeyrek Altın',
    currencySymbolName: 'Çeyrek Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 5007.29,
    sellPrice: 5122.63,
    lastPrice: 5122.63,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Yarım Altın',
    currencySymbolName: 'Yarım Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 9983.29,
    sellPrice: 10245.26,
    lastPrice: 10245.26,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Tam Altın',
    currencySymbolName: 'Tam Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 20029.17,
    sellPrice: 20427.86,
    lastPrice: 20427.86,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Cumhuriyet Altını',
    currencySymbolName: 'Cumhuriyet Altını',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 20752,
    sellPrice: 21065,
    lastPrice: 21065,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Ata Altın',
    currencySymbolName: 'Ata Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 20655.08,
    sellPrice: 21179.81,
    lastPrice: 21179.81,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: '14 Ayar Bilezik',
    currencySymbolName: '14 Ayar Bilezik',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 1783.85,
    sellPrice: 1785.87,
    lastPrice: 1785.87,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: '18 Ayar Bilezik',
    currencySymbolName: '18 Ayar Bilezik',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 2284.58,
    sellPrice: 2287.17,
    lastPrice: 2287.17,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Kapalıçarşı Amerikan Doları',
    currencySymbolName: 'USD',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Kapalıçarşı Gram Altın',
    currencySymbolName: 'Gram Altın',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  HomeCurrency(
    currencyImage:
        'https://ideacdn.net/shop/zr/79/myassets/products/866/avrupa-bayragi-ab.jpg?revision=1712609888',
    currencyName: 'Kapalıçarşı Euro',
    currencySymbolName: 'EUR',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 37.0585,
    sellPrice: 37.0716,
    lastPrice: 37.0716,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'Kapalıçarşı İngiliz Sterlini',
    currencySymbolName: 'GBP',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'Kapalıçarşı İsviçre Frangı',
    currencySymbolName: 'CHF',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Kapalıçarşı Kanada Doları',
    currencySymbolName: 'CAD',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  HomeCurrency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Kapalıçarşı Rus Rublesi',
    currencySymbolName: 'RUB',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'Kapalıçarşı BAE Dirhemi',
    currencySymbolName: 'AED',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Kapalıçarşı Avustralya Doları',
    currencySymbolName: 'AUD',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  HomeCurrency(
    currencyImage:
        'https://bayrakevi.com/image/cache/data/devlet1/danimarka-800x800.jpg',
    currencyName: 'Kapalıçarşı Danimarka Kronu',
    currencySymbolName: 'DKK',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: ' Papara Gram Altın',
    currencySymbolName: 'Gram Altın',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Akbank Amerikan Doları',
    currencySymbolName: 'USD',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  HomeCurrency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Akbank Gram Altın',
    currencySymbolName: 'Gram Altın',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'Akbank İngiliz Sterlini',
    currencySymbolName: 'GBP',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'Akbank İsviçre Frangı',
    currencySymbolName: 'CHF',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Akbank Kanada Doları',
    currencySymbolName: 'CAD',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  HomeCurrency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Akbank Rus Rublesi',
    currencySymbolName: 'RUB',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'Akbank BAE Dirhemi',
    currencySymbolName: 'AED',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Akbank Avustralya Doları',
    currencySymbolName: 'AUD',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  HomeCurrency(
    currencyImage:
        'https://bayrakevi.com/image/cache/data/devlet1/danimarka-800x800.jpg',
    currencyName: 'Akbank Danimarka Kronu',
    currencySymbolName: 'DKK',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'A1 CAPITAL YATIRIM',
    currencySymbolName: 'A1CAP',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'ACIPAYAM SELULOZ',
    currencySymbolName: 'ACSEL',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage: 'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'ADEL KALEMCILIK',
    currencySymbolName: 'ADEL',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage: 'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'ADRA GMYO',
    currencySymbolName: 'ADGYO',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'ANADOLU EFES',
    currencySymbolName: 'AEFES',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage: 'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'AFYON CIMENTO',
    currencySymbolName: 'AFYON',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage: 'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'AGESA HAYAT EMEKLILIK',
    currencySymbolName: 'AGESA',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage: 'https://a1capital.b-cdn.net/wp-content/uploads/2021/07/a1-capital-logo.png',
    currencyName: 'AGROTECH TEKNOLOJI',
    currencySymbolName: 'AGROT',
    currencyCategory: CurrencyCategory.share,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'AK PORTFOY BIST BANKA DISI LIKIT 10 HSY BYF',
    currencySymbolName: 'APBDL',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'AK PORTFOY BIST LIKIT BANKA HSY BYF',
    currencySymbolName: 'APLIB',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'AK PORTFOY BIST 30 ENDEKSI HSY BYF',
    currencySymbolName: 'APX30',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'OSMANLI PORTFOY BIST 30 HSY BYF',
    currencySymbolName: 'OPX30',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'IS PORTFOY ALTIN KATILIM BYF',
    currencySymbolName: 'ISGLK',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'ZIRAAT PORTFOY BIST TEMETTU 25 ENDEKS HSY BYF',
    currencySymbolName: 'ZTM25',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'OSMANLI PORTFOY BIST TEMETTU 25 ENDEKS HSY BYF',
    currencySymbolName: 'OPT25',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencyName: 'QNB PORTFOY GUMUS KATILIM BYF',
    currencySymbolName: 'GMSTR',
    currencyCategory: CurrencyCategory.exchangeTradedFund,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'XU030',
    currencyName: 'BIST 30',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'XU050',
    currencyName: 'BIST 50',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'XU0100',
    currencyName: 'BIST 100',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'XBANK',
    currencyName: 'BIST BANKA',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'XTMTU',
    currencyName: 'BIST TEMETTU',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'XTM25',
    currencyName: 'BIST TEMETTU 25',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'ISIST',
    currencyName: 'IS BANKASI ISTIRAKLERI',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'ISIST_CFCNTLTL',
    currencyName: 'IS BANKASI ISTIRAKLERI GETIRI',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'RK030G10',
    currencyName: 'BIST 30 RK %10 (GETIRI)',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://www.borsaistanbul.com/files/borsa_istanbul_logo_yatay.png',
    currencySymbolName: 'RK030G15',
    currencyName: 'BIST 30 RK %15 (GETIRI)',
    currencyCategory: CurrencyCategory.stockIndexes,
    buyPrice: 21.46,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://static.coinpaprika.com/coin/trump-mog-trump/logo.png?rev=',
    currencyName: 'MOG TRUMP',
    currencySymbolName: 'TRUMP',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.170764,
    sellPrice: 0.170764,
    lastPrice: 0.170764,
  ),
  HomeCurrency(
    currencyImage:
        'https://assets.coingecko.com/coins/images/39408/large/sigma_logo.jpg?1722053407',
    currencyName: 'Sigma',
    currencySymbolName: 'SIGMA',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.084608,
    sellPrice: 0.084608,
    lastPrice: 0.084608,
  ),
  HomeCurrency(
    currencyImage:
        'https://assets.coingecko.com/coins/images/3545/large/DSiD9ZhWsAE_8cS.png?1696504231',
    currencyName: 'Bitcoin Pro',
    currencySymbolName: 'BTCP',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 33.07,
    sellPrice: 33.07,
    lastPrice: 33.07,
  ),
  HomeCurrency(
    currencyImage:
        'https://s2.coinmarketcap.com/static/img/coins/200x200/28789.png',
    currencyName: 'Silly Dragon',
    currencySymbolName: 'SILLY',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.69212,
    sellPrice: 0.69212,
    lastPrice: 0.69212,
  ),
  HomeCurrency(
    currencyImage:
        'https://pbs.twimg.com/profile_images/1565875722547183618/XJ88LbOd_400x400.jpg',
    currencyName: 'Netvrk',
    currencySymbolName: 'NETVR',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.12449,
    sellPrice: 0.12449,
    lastPrice: 0.12449,
  ),
  HomeCurrency(
    currencyImage:
        'https://assets.coingecko.com/coins/images/31401/large/sticker_%281%29.jpg?1702371083',
    currencyName: 'SPX6900',
    currencySymbolName: 'SPX',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.829085,
    sellPrice: 0.829085,
    lastPrice: 0.829085,
  ),
  HomeCurrency(
    currencyImage:
        'https://academy-public.coinmarketcap.com/srd-optimized-uploads/ac0755a9017e4c0ba9cf413792fbd836.png',
    currencyName: 'RETARDIO',
    currencySymbolName: 'RETARDIO',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.166572,
    sellPrice: 0.166572,
    lastPrice: 0.166572,
  ),
  HomeCurrency(
    currencyImage:
        'https://s2.coinmarketcap.com/static/img/coins/200x200/25220.png',
    currencyName: 'HarryPotterObamaSonic10lnu(ETH)',
    currencySymbolName: 'BITCOIN',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.308778,
    sellPrice: 0.308778,
    lastPrice: 0.308778,
  ),
  HomeCurrency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6xMWEcWc53ufDZJ-XIttyT3BsnBNbbDmclg&s',
    currencyName: 'Apu Apustaja',
    currencySymbolName: 'APU',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.087959,
    sellPrice: 0.087959,
    lastPrice: 0.087959,
  ),
  HomeCurrency(
    currencyImage:
        'https://s2.coinmarketcap.com/static/img/coins/200x200/29920.png',
    currencyName: 'Slerf',
    currencySymbolName: 'SLERF',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.246344,
    lastPrice: 0.246344,
    sellPrice: 0.246344,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Amerikan Doları Euro',
    currencySymbolName: 'USD/EUR',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  HomeCurrency(
    currencyImage:
        'https://ideacdn.net/shop/zr/79/myassets/products/866/avrupa-bayragi-ab.jpg?revision=1712609888',
    currencyName: 'Euro Amerikan Doları',
    currencySymbolName: 'EUR/USD',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 37.0585,
    sellPrice: 37.0716,
    lastPrice: 37.0716,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'İngiliz Sterlini Amerikan Doları',
    currencySymbolName: 'GBP/USD',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'İsviçre Frangı Amerikan Doları',
    currencySymbolName: 'CHF/USD',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Kanada Doları Euro',
    currencySymbolName: 'CAD/EUR',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  HomeCurrency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Rus Rublesi Amerikan Doları',
    currencySymbolName: 'RUB/USD',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'BAE Dirhemi Euro',
    currencySymbolName: 'AED/EUR',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  HomeCurrency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Avustralya Doları İngiliz Sterlini',
    currencySymbolName: 'AUD/GBP',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  HomeCurrency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMD7mUigrxGB7pF8MTxdTQGr2qwLLjUlFj9Q&s',
    currencyName: 'Danimarka Kronu Euro',
    currencySymbolName: 'DKK/EUR',
    currencyCategory: CurrencyCategory.parity,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  HomeCurrency(
    currencyImage:
        'https://static8.depositphotos.com/1000422/991/v/380/depositphotos_9919632-stock-illustration-metal-oil-barrel.jpg',
    currencyName: 'Brent Petrol',
    currencySymbolName: 'Brent Petrol',
    currencyCategory: CurrencyCategory.commodity,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://static8.depositphotos.com/1000422/991/v/380/depositphotos_9919632-stock-illustration-metal-oil-barrel.jpg',
    currencyName: 'ABD Ham Petrol',
    currencySymbolName: 'ABD Ham Petrol',
    currencyCategory: CurrencyCategory.commodity,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://bayrakevi.com/image/cache/data/devlet1/danimarka-800x800.jpg',
    currencyName: 'Altın Ons',
    currencySymbolName: 'Altın Ons',
    currencyCategory: CurrencyCategory.commodity,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://w7.pngwing.com/pngs/874/979/png-transparent-bullion-silver-good-delivery-gold-metal-silver-rectangle-bullion-gold-thumbnail.png',
    currencyName: 'Gümüş Ons',
    currencySymbolName: 'Gümüş Ons',
    currencyCategory: CurrencyCategory.commodity,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://c8.alamy.com/comp/KYGXKK/platinum-chemical-element-periodic-table-science-symbol-KYGXKK.jpg',
    currencyName: 'Platinum',
    currencySymbolName: 'Platinum',
    currencyCategory: CurrencyCategory.commodity,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://as1.ftcdn.net/v2/jpg/04/65/40/82/1000_F_465408283_GpWEkcMuqI7nJoOQty47BkWJdZv3Vyt6.jpg',
    currencyName: 'Paladyum',
    currencySymbolName: 'Paladyum',
    currencyCategory: CurrencyCategory.commodity,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencySymbolName: 'TAHVIL',
    currencyName: 'TR 2 Yıllık Tahvil Faizi',
    currencyCategory: CurrencyCategory.bond,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencySymbolName: 'TAHVIL5Y',
    currencyName: 'TR 5 Yıllık Tahvil Faizi',
    currencyCategory: CurrencyCategory.bond,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencySymbolName: 'TAHVIL10Y',
    currencyName: 'TR 10 Yıllık Tahvil Faizi',
    currencyCategory: CurrencyCategory.bond,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencySymbolName: 'DXY',
    currencyName: 'Dolar Endeksi',
    currencyCategory: CurrencyCategory.other,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  HomeCurrency(
    currencyImage:
        'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/17/03/77/17037763-5e9b-10f1-7658-b1deecbe4843/AppIcon-0-0-1x_U007ephone-0-1-0-85-220.png/1200x630wa.png',
    currencySymbolName: 'DVZSP1',
    currencyName: 'TR 10 Yıllık Tahvil Faizi',
    currencyCategory: CurrencyCategory.other,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
];
