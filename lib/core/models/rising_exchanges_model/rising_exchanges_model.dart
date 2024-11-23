class Currency {
  Currency({
    required this.currencyImage,
    required this.currencyName,
    required this.currencySymbolName,
    required this.buyPrice,
    required this.sellPrice,
    required this.lastPrice,
    required this.changedValueOfDay,
    required this.changedPercentageOfDay,
    required this.changedPercentageOfWeek,
    required this.changedPercentageOfMonth,
    required this.changedPercentageOfThreeMonth,
    required this.changedPercentageOfYear,
    required this.minimumValueOfDay,
    required this.maximumValueOfDay,
    required this.minimumValueOfMonth,
    required this.maximumValueOfMonth,
    required this.minimumValueOfYear,
    required this.maximumValueOfYear,
  });

  final String currencyImage;
  final String currencyName;
  final String currencySymbolName;
  double buyPrice;
  double sellPrice;
  double lastPrice;
  double changedValueOfDay;
  double changedPercentageOfDay;
  double changedPercentageOfWeek;
  double changedPercentageOfMonth;
  double changedPercentageOfThreeMonth;
  double changedPercentageOfYear;
  double minimumValueOfDay;
  double maximumValueOfDay;
  double minimumValueOfMonth;
  double maximumValueOfMonth;
  double minimumValueOfYear;
  double maximumValueOfYear;

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
}

List<Currency> risingExchangesOfWeek = [
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/c/ce/Flag_of_Iceland.svg',
    currencyName: 'İzlanda Kronası',
    currencySymbolName: 'ISK',
    buyPrice: 0.2498,
    sellPrice: 0.2499,
    lastPrice: 0.2499,
    changedValueOfDay: 0,
    changedPercentageOfDay: 0.78,
    changedPercentageOfWeek: 0.82,
    changedPercentageOfMonth: 0.17,
    changedPercentageOfThreeMonth: 2.60,
    changedPercentageOfYear: 23.24,
    minimumValueOfDay: 0.2499,
    maximumValueOfDay: 4.4294,
    minimumValueOfMonth: 0.2464,
    maximumValueOfMonth: 4.4316,
    minimumValueOfYear: 0.1988,
    maximumValueOfYear: 4.4845,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Amerikan Doları',
    currencySymbolName: 'USD',
    buyPrice: 34.4229,
    sellPrice: 34.4465,
    lastPrice: 34.4465,
    changedValueOfDay: 0.10,
    changedPercentageOfDay: 0.30,
    changedPercentageOfWeek: 0.15,
    changedPercentageOfMonth: 0.80,
    changedPercentageOfThreeMonth: 2.23,
    changedPercentageOfYear: 20.17,
    minimumValueOfDay: 34.2525,
    maximumValueOfDay: 34.8345,
    minimumValueOfMonth: 33.9112,
    maximumValueOfMonth: 34.8345,
    minimumValueOfYear: 28.4435,
    maximumValueOfYear: 34.8345,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Flag_of_Lebanon.svg/250px-Flag_of_Lebanon.svg.png',
    currencyName: 'Lübnan Lirası',
    currencySymbolName: 'LBP',
    buyPrice: 0.0004,
    sellPrice: 0.0004,
    lastPrice: 0.0004,
    changedValueOfDay: 0,
    changedPercentageOfDay: 0.35,
    changedPercentageOfWeek: 0.79,
    changedPercentageOfMonth: 0.71,
    changedPercentageOfThreeMonth: 2.30,
    changedPercentageOfYear: -79.83,
    minimumValueOfDay: 0.0004,
    maximumValueOfDay: 0.0696,
    minimumValueOfMonth: 0.004,
    maximumValueOfMonth: 0.0713,
    minimumValueOfYear: 0.0003,
    maximumValueOfYear: 0.0746,
  ),
  Currency(
    currencyImage:
        'https://assets.wikiwand.com/_next/image?url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F7%2F77%2FFlag_of_Hejaz_1917.svg%2F320px-Flag_of_Hejaz_1917.svg.png&w=2048&q=75',
    currencyName: 'Ürdün Dinarı',
    currencySymbolName: 'JOD',
    buyPrice: 48.5445,
    sellPrice: 48.5778,
    lastPrice: 48.5778,
    changedValueOfDay: 0.12,
    changedPercentageOfDay: 0.24,
    changedPercentageOfWeek: 0.22,
    changedPercentageOfMonth: 0.54,
    changedPercentageOfThreeMonth: 2.16,
    changedPercentageOfYear: 20.15,
    minimumValueOfDay: 4.4159,
    maximumValueOfDay: 48.5611,
    minimumValueOfMonth: 4.3923,
    maximumValueOfMonth: 48.5611,
    minimumValueOfYear: 3.6537,
    maximumValueOfYear: 48.5611,
  ),
  Currency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOkxOEW_qI2en58FR3X0e5ARXJY5yu2xR3ZA&s',
    currencyName: 'Ukrayna Grivnası',
    currencySymbolName: 'UAH',
    buyPrice: 0.8295,
    sellPrice: 0.83,
    lastPrice: 0.83,
    changedValueOfDay: 0,
    changedPercentageOfDay: -0.29,
    changedPercentageOfWeek: 0.21,
    changedPercentageOfMonth: 0.41,
    changedPercentageOfThreeMonth: 1.24,
    changedPercentageOfYear: 4.92,
    minimumValueOfDay: 0.0026,
    maximumValueOfDay: 0.8297,
    minimumValueOfMonth: 0.0026,
    maximumValueOfMonth: 0.8325,
    minimumValueOfYear: 0.0022,
    maximumValueOfYear: 0.8350,
  ),
  Currency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_7tKFVAG2kflyh9TNPjDT08oGIcegsJhzPw&s',
    currencyName: 'Azerbaycan Manatı',
    currencySymbolName: 'AZN',
    buyPrice: 20.2488,
    sellPrice: 20.2626,
    lastPrice: 20.2626,
    changedValueOfDay: 0.06,
    changedPercentageOfDay: 0.30,
    changedPercentageOfWeek: 0.15,
    changedPercentageOfMonth: 0.80,
    changedPercentageOfThreeMonth: 2.23,
    changedPercentageOfYear: 26.81,
    minimumValueOfDay: 0.0343,
    maximumValueOfDay: 20.2557,
    minimumValueOfMonth: 0.0343,
    maximumValueOfMonth: 20.2576,
    minimumValueOfYear: 0.0343,
    maximumValueOfYear: 20.2576,
  ),
  Currency(
    currencyImage:
        'https://w7.pngwing.com/pngs/540/310/png-transparent-flag-of-saudi-arabia-national-flag-flag-of-the-united-states-flag-miscellaneous-angle-flag.png',
    currencyName: 'Suudi Arabistan Riyali',
    currencySymbolName: 'SAR',
    buyPrice: 9.1544,
    sellPrice: 9.1823,
    lastPrice: 9.1823,
    changedValueOfDay: 0.03,
    changedPercentageOfDay: 0.28,
    changedPercentageOfWeek: 0.16,
    changedPercentageOfMonth: 0.66,
    changedPercentageOfYear: 20,
    changedPercentageOfThreeMonth: 2.18,
    minimumValueOfDay: 9.1302,
    maximumValueOfDay: 9.2379,
    minimumValueOfMonth: 9.0283,
    maximumValueOfMonth: 9.2379,
    minimumValueOfYear: 7.5941,
    maximumValueOfYear: 9.2379,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'BAE Dirhemi',
    currencySymbolName: 'AED',
    buyPrice: 9.3727,
    sellPrice: 9.379,
    lastPrice: 9.379,
    changedValueOfDay: 0.03,
    changedPercentageOfDay: 0.28,
    changedPercentageOfWeek: 0.16,
    changedPercentageOfMonth: 0.71,
    changedPercentageOfThreeMonth: 2.28,
    changedPercentageOfYear: 20.19,
    minimumValueOfDay: 9.3258,
    maximumValueOfDay: 9.4839,
    maximumValueOfMonth: 9.4839,
    maximumValueOfYear: 9.4839,
    minimumValueOfMonth: 9.2326,
    minimumValueOfYear: 7.7554,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Flag_of_Qatar.svg/1200px-Flag_of_Qatar.svg.png',
    currencyName: 'Katar Riyali',
    currencySymbolName: 'QAR',
    buyPrice: 9.4509,
    sellPrice: 9.4645,
    lastPrice: 9.4645,
    changedValueOfDay: 0.03,
    changedPercentageOfDay: 0.27,
    changedPercentageOfWeek: 0.14,
    changedPercentageOfMonth: 0.73,
    changedPercentageOfThreeMonth: 2.28,
    changedPercentageOfYear: 20.16,
    minimumValueOfDay: 9.4187,
    maximumValueOfDay: 9.53,
    minimumValueOfMonth: 9.3210,
    maximumValueOfMonth: 9.53,
    minimumValueOfYear: 7.8120,
    maximumValueOfYear: 9.8360,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Flag_of_Oman.svg/800px-Flag_of_Oman.svg.png',
    currencyName: 'Umman Riyali',
    currencySymbolName: 'OMR',
    buyPrice: 89.4252,
    sellPrice: 89.4675,
    lastPrice: 89.4675,
    changedValueOfDay: 0.27,
    changedPercentageOfDay: 0.30,
    changedPercentageOfWeek: 0.20,
    changedPercentageOfMonth: 0.61,
    changedPercentageOfThreeMonth: 2.24,
    minimumValueOfDay: 0.0692,
    changedPercentageOfYear: 20.04,
    maximumValueOfDay: 89.4385,
    minimumValueOfMonth: 0.0692,
    maximumValueOfMonth: 89.5216,
    minimumValueOfYear: 0.0611,
    maximumValueOfYear: 89.5216,
  ),
];
