class CryptoList {
  late String cryptoSymbolName;
  late String cryptoName;
  late double price;
  late double changedValue;
  late double changedValuePercentage;

  CryptoList(this.cryptoSymbolName, this.cryptoName, this.price,
      this.changedValue, this.changedValuePercentage);

  static List<CryptoList> cryptoList = [
    CryptoList("TRUMP", "MOG TRUMP", 0.170764, 0.07, 74.42),
    CryptoList("SIGMA", "Sigma", 0.084608, 0.01, 10.02),
    CryptoList("BTCP", "Bitcoin Pro", 33.07, 4.11, 14.20),
    CryptoList("SILLY", "Silly Dragon", 0.02269212, 0.00, 1.66),
    CryptoList("NETVR", "Netvrk", 0.12449, 0.01, -9.41),
    CryptoList("SPX", "SPX6900", 0.829085, 0.10, -10.47),
    CryptoList("RETARDIO", "RETARDIO", 0.166572, -0.02, -11.65),
    CryptoList(
        "BITCOIN", "HarryPotterObamaSonic10lnu(ETH)", 0.308778, -0.04, -10.95),
    CryptoList("APU", "Apu Apustaja", 0.00087959, -0.00, -2.25),
    CryptoList("SLERF", "Slerf", 0.246344, -0.05, 26.33),
  ];
}
