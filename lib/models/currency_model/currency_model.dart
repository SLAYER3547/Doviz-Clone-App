enum CurrencyCategory { exchange, gold, grandBazaar, banks, cryptoMoney }

class Currency {
  Currency({
    required this.currencyImage,
    required this.currencyName,
    required this.currencySymbolName,
    required this.currencyCategory,
    required this.buyPrice,
    required this.sellPrice,
    required this.lastPrice,
  });
  final String currencyImage;
  final String currencyName;
  final String currencySymbolName;
  CurrencyCategory currencyCategory;
  double buyPrice;
  double sellPrice;
  double lastPrice;

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

List<Currency> currencies = [
  Currency(
    currencyImage:
        'https://seeklogo.com/images/T/turkiye-yuvarlak-logo-6483C54DD8-seeklogo.com.png',
    currencyName: 'Türk Lirası',
    currencySymbolName: 'TL',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 1,
    sellPrice: 1,
    lastPrice: 1,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Amerikan Doları',
    currencySymbolName: 'USD',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  Currency(
    currencyImage:
        'https://ideacdn.net/shop/zr/79/myassets/products/866/avrupa-bayragi-ab.jpg?revision=1712609888',
    currencyName: 'Euro',
    currencySymbolName: 'EUR',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 37.0585,
    sellPrice: 37.0716,
    lastPrice: 37.0716,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'İngiliz Sterlini',
    currencySymbolName: 'GBP',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'İsviçre Frangı',
    currencySymbolName: 'CHF',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Kanada Doları',
    currencySymbolName: 'CAD',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  Currency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Rus Rublesi',
    currencySymbolName: 'RUB',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'BAE Dirhemi',
    currencySymbolName: 'AED',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Avustralya Doları',
    currencySymbolName: 'AUD',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  Currency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMD7mUigrxGB7pF8MTxdTQGr2qwLLjUlFj9Q&s',
    currencyName: 'Danimarka Kronu',
    currencySymbolName: 'DKK',
    currencyCategory: CurrencyCategory.exchange,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  Currency(
    currencyImage:
        'https://bayrakevi.com/image/cache/data/devlet1/danimarka-800x800.jpg',
    currencyName: 'Ons Altın',
    currencySymbolName: 'Ons Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 88095.22,
    sellPrice: 88096.15,
    lastPrice: 88096.15,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Gram Altın',
    currencySymbolName: 'Gram Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Gram Has Altın',
    currencySymbolName: 'Gram Has Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 3013.91,
    sellPrice: 3014.56,
    lastPrice: 3014.56,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Çeyrek Altın',
    currencySymbolName: 'Çeyrek Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 5007.29,
    sellPrice: 5122.63,
    lastPrice: 5122.63,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Yarım Altın',
    currencySymbolName: 'Yarım Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 9983.29,
    sellPrice: 10245.26,
    lastPrice: 10245.26,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Tam Altın',
    currencySymbolName: 'Tam Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 20029.17,
    sellPrice: 20427.86,
    lastPrice: 20427.86,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Cumhuriyet Altını',
    currencySymbolName: 'Cumhuriyet Altını',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 20752,
    sellPrice: 21065,
    lastPrice: 21065,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Ata Altın',
    currencySymbolName: 'Ata Altın',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 20655.08,
    sellPrice: 21179.81,
    lastPrice: 21179.81,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: '14 Ayar Bilezik',
    currencySymbolName: '14 Ayar Bilezik',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 1783.85,
    sellPrice: 1785.87,
    lastPrice: 1785.87,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: '18 Ayar Bilezik',
    currencySymbolName: '18 Ayar Bilezik',
    currencyCategory: CurrencyCategory.gold,
    buyPrice: 2284.58,
    sellPrice: 2287.17,
    lastPrice: 2287.17,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Kapalıçarşı Amerikan Doları',
    currencySymbolName: 'USD',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Kapalıçarşı Gram Altın',
    currencySymbolName: 'Gram Altın',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  Currency(
    currencyImage:
        'https://ideacdn.net/shop/zr/79/myassets/products/866/avrupa-bayragi-ab.jpg?revision=1712609888',
    currencyName: 'Kapalıçarşı Euro',
    currencySymbolName: 'EUR',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 37.0585,
    sellPrice: 37.0716,
    lastPrice: 37.0716,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'Kapalıçarşı İngiliz Sterlini',
    currencySymbolName: 'GBP',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'Kapalıçarşı İsviçre Frangı',
    currencySymbolName: 'CHF',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Kapalıçarşı Kanada Doları',
    currencySymbolName: 'CAD',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  Currency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Kapalıçarşı Rus Rublesi',
    currencySymbolName: 'RUB',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'Kapalıçarşı BAE Dirhemi',
    currencySymbolName: 'AED',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Kapalıçarşı Avustralya Doları',
    currencySymbolName: 'AUD',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  Currency(
    currencyImage:
        'https://bayrakevi.com/image/cache/data/devlet1/danimarka-800x800.jpg',
    currencyName: 'Kapalıçarşı Danimarka Kronu',
    currencySymbolName: 'DKK',
    currencyCategory: CurrencyCategory.grandBazaar,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Gram Altın',
    currencySymbolName: 'Papara Gram Altın',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/250px-Flag_of_the_United_States.svg.png',
    currencyName: 'Akbank Amerikan Doları',
    currencySymbolName: 'USD',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 34.2655,
    sellPrice: 34.2750,
    lastPrice: 34.2750,
  ),
  Currency(
    currencyImage:
        'https://oryakuyumculuk.com/wp-content/uploads/2020/09/22_ayar_1_gram_altin.jpg',
    currencyName: 'Gram Altın',
    currencySymbolName: 'Akbank Gram Altın',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 3029.36,
    sellPrice: 3029.69,
    lastPrice: 3029.69,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_the_United_Kingdom_%283-5%29.svg/300px-Flag_of_the_United_Kingdom_%283-5%29.svg.png',
    currencyName: 'Akbank İngiliz Sterlini',
    currencySymbolName: 'GBP',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 44.5021,
    sellPrice: 44.5078,
    lastPrice: 44.5078,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/200px-Flag_of_Switzerland_%28Pantone%29.svg.png',
    currencyName: 'Akbank İsviçre Frangı',
    currencySymbolName: 'CHF',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 39.5313,
    sellPrice: 39.5516,
    lastPrice: 39.5516,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Flag_of_Canada_%28Pantone%29.svg/800px-Flag_of_Canada_%28Pantone%29.svg.png',
    currencyName: 'Akbank Kanada Doları',
    currencySymbolName: 'CAD',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 24.6877,
    sellPrice: 24.6976,
    lastPrice: 24.6976,
  ),
  Currency(
    currencyImage:
        'https://w7.pngwing.com/pngs/996/895/png-transparent-flag-of-russia-fahne-map-bunting-flag-blue-angle-flag.png',
    currencyName: 'Akbank Rus Rublesi',
    currencySymbolName: 'RUB',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 0.3517,
    sellPrice: 0.3518,
    lastPrice: 0.3518,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/1200px-Flag_of_the_United_Arab_Emirates.svg.png',
    currencyName: 'Akbank BAE Dirhemi',
    currencySymbolName: 'AED',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 9.3296,
    sellPrice: 9.3322,
    lastPrice: 9.3322,
  ),
  Currency(
    currencyImage:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png',
    currencyName: 'Akbank Avustralya Doları',
    currencySymbolName: 'AUD',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 22.5247,
    sellPrice: 22.5395,
    lastPrice: 22.5395,
  ),
  Currency(
    currencyImage:
        'https://bayrakevi.com/image/cache/data/devlet1/danimarka-800x800.jpg',
    currencyName: 'Akbank Danimarka Kronu',
    currencySymbolName: 'DKK',
    currencyCategory: CurrencyCategory.banks,
    buyPrice: 4.9665,
    sellPrice: 4.9684,
    lastPrice: 4.9684,
  ),
  Currency(
    currencyImage:
        'https://static.coinpaprika.com/coin/trump-mog-trump/logo.png?rev=',
    currencyName: 'MOG TRUMP',
    currencySymbolName: 'TRUMP',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.170764,
    sellPrice: 0.170764,
    lastPrice: 0.170764,
  ),
  Currency(
    currencyImage:
        'https://assets.coingecko.com/coins/images/39408/large/sigma_logo.jpg?1722053407',
    currencyName: 'Sigma',
    currencySymbolName: 'SIGMA',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.084608,
    sellPrice: 0.084608,
    lastPrice: 0.084608,
  ),
  Currency(
    currencyImage:
        'https://assets.coingecko.com/coins/images/3545/large/DSiD9ZhWsAE_8cS.png?1696504231',
    currencyName: 'Bitcoin Pro',
    currencySymbolName: 'BTCP',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 33.07,
    sellPrice: 33.07,
    lastPrice: 33.07,
  ),
  Currency(
    currencyImage:
        'https://s2.coinmarketcap.com/static/img/coins/200x200/28789.png',
    currencyName: 'Silly Dragon',
    currencySymbolName: 'SILLY',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.02269212,
    sellPrice: 0.02269212,
    lastPrice: 0.02269212,
  ),
  Currency(
    currencyImage:
        'https://pbs.twimg.com/profile_images/1565875722547183618/XJ88LbOd_400x400.jpg',
    currencyName: 'Netvrk',
    currencySymbolName: 'NETVR',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.12449,
    sellPrice: 0.12449,
    lastPrice: 0.12449,
  ),
  Currency(
    currencyImage:
        'https://assets.coingecko.com/coins/images/31401/large/sticker_%281%29.jpg?1702371083',
    currencyName: 'SPX6900',
    currencySymbolName: 'SPX',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.829085,
    sellPrice: 0.829085,
    lastPrice: 0.829085,
  ),
  Currency(
    currencyImage:
        'https://academy-public.coinmarketcap.com/srd-optimized-uploads/ac0755a9017e4c0ba9cf413792fbd836.png',
    currencyName: 'RETARDIO',
    currencySymbolName: 'RETARDIO',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.166572,
    sellPrice: 0.166572,
    lastPrice: 0.166572,
  ),
  Currency(
    currencyImage:
        'https://s2.coinmarketcap.com/static/img/coins/200x200/25220.png',
    currencyName: 'HarryPotterObamaSonic10lnu(ETH)',
    currencySymbolName: 'BITCOIN',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.308778,
    sellPrice: 0.308778,
    lastPrice: 0.308778,
  ),
  Currency(
    currencyImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6xMWEcWc53ufDZJ-XIttyT3BsnBNbbDmclg&s',
    currencyName: 'Apu Apustaja',
    currencySymbolName: 'APU',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.00087959,
    sellPrice: 0.00087959,
    lastPrice: 0.00087959,
  ),
  Currency(
    currencyImage:
        'https://s2.coinmarketcap.com/static/img/coins/200x200/29920.png',
    currencyName: 'Slerf',
    currencySymbolName: 'SLERF',
    currencyCategory: CurrencyCategory.cryptoMoney,
    buyPrice: 0.246344,
    lastPrice: 0.246344,
    sellPrice: 0.246344,
  ),
];
