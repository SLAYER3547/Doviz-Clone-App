class MostFollowedMoneyList {
  MostFollowedMoneyList(
    this.moneySymbolName,
    this.moneyName,
    this.moneyPrice,
    this.changedValueOfMoney,
    this.changedValuePercentageOfMoney,
  );
  late String moneySymbolName;
  late String moneyName;
  late double moneyPrice;
  late double changedValueOfMoney;
  late double changedValuePercentageOfMoney;

  static List<MostFollowedMoneyList> mostFollowedMoneyList = [
    MostFollowedMoneyList('Gram Altın', 'Gram Altın', 2988.47, 26.36, 0.89),
    MostFollowedMoneyList('USD', 'Amerikan Doları', 34.5462, 0.0655, 0.19),
    MostFollowedMoneyList('EUR', 'Euro', 36.0046, -0.2283, -0.63),
    MostFollowedMoneyList('XU100', 'BIST 100', 9509.10, 141.45, 1.51),
    MostFollowedMoneyList('Çeyrek Altın', 'Çeyrek Altın', 5120.54, 51.20, 1.01),
    MostFollowedMoneyList('BTC', 'Bitcoin', 97.644, 391, 0.40),
    MostFollowedMoneyList('Tam Altın', 'Tam Altın', 20419.54, 206.18, 1.02),
    MostFollowedMoneyList('Gram Gümüş', 'Gram Gümüş', 34.53, 0.38, 1.11),
    MostFollowedMoneyList('Ons Altın', 'Ons Altın', 2690.90, 18.97, 0.71),
    MostFollowedMoneyList('XRP', 'Ripple', 1.4117, 0.2918, 26.06),
  ];
}
