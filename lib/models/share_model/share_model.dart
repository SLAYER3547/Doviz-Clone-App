class ShareList {
  late String shareSymbolName;
  late String shareName;
  late double price;
  late double changedValue;
  late double changedValuePercentage;

  ShareList(this.shareSymbolName, this.shareName, this.price, this.changedValue,
      this.changedValuePercentage);

  static List<ShareList> shareList = [
    ShareList("SKTAS", "SOKTAS", 4.95, 0.45, 10.00),
    ShareList("TKFEN", "TEKFEN HOLDING", 63.95, 0.90, 1.91),
    ShareList("SOKE", "SOKE DEGIRMENCILIK", 13.77, 0.67, 5.11),
    ShareList("MARKA", "MARKA YATIRIM HOLDING", 51.40, 4.66, 9.97),
    ShareList("IZFAS", "IZMIR FIRCA", 42.32, 0.24, 0.57),
    ShareList("ICUGS", "ICU GIRISIM", 26.16, -0.10, -0.38),
    ShareList("ULUUN", "ULUSOY UN SANAYI", 6.49, 0.21, 3.34),
    ShareList("SAFKR", "SAFKAR EGE SOGUTMACILIK", 58.95, 0.75, 1.29),
    ShareList("DURDO", "DURAN DOGAN BASIM", 15.72, -1.20, -7.09),
    ShareList("TUREX", "TUREX TURIZM TASIMACILIK", 103.90, 1.60, 1.56),
  ];
}
