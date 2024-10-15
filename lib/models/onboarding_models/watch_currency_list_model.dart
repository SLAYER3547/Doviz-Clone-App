class WatchCurrencyList {
  late String currencyImage;
  late String currencySymbolName;
  late String currencyName;
  late bool isFavourited;
  late double price;
  late double changedValue;
  late double changedPercentage;

  WatchCurrencyList(
      this.currencyImage,
      this.currencySymbolName,
      this.currencyName,
      this.isFavourited,
      this.price,
      this.changedValue,
      this.changedPercentage);

  static List<WatchCurrencyList> currencyList = [
    WatchCurrencyList("assets/images/gram_altın.jpeg", "Gram Altın",
        "Gram Altın", true, 2937.94, 1212.2, 70.24),
    WatchCurrencyList("assets/images/united_states_flag.png", "USD",
        "Amerikan Doları", true, 34.2812, 6.513, 23.46),
    WatchCurrencyList("assets/images/europe_flag.png", "EUR", "Euro", true,
        37.5022, 8.29, 28.39),
    WatchCurrencyList("assets/images/bist.png", "XU100", "BIST 100", true,
        8876.22, 545.58, 6.55),
  ];

  static List<WatchCurrencyList> onboardingCurrencyList = [
    WatchCurrencyList("assets/images/gram_altın.jpeg", "Gram Altın",
        "Gram Altın", true, 2937.94, 1212.2, 70.24),
    WatchCurrencyList("assets/images/united_states_flag.png", "USD",
        "Amerikan Doları", true, 34.2812, 6.513, 23.46),
    WatchCurrencyList("assets/images/europe_flag.png", "EUR", "Euro", true,
        37.5022, 8.29, 28.39),
    WatchCurrencyList("assets/images/bist.png", "XU100", "BIST 100", true,
        8876.22, 545.58, 6.55),
    WatchCurrencyList("assets/images/cumhuriyet.jpg", "Cumhuriyet Altını",
        "Cumhuriyet Altını", false, 20100, 100, 12.25),
    WatchCurrencyList("assets/images/ata.png", "Ata Altın", "Ata Altın", false,
        22000, 125, 11.8),
  ];
}
