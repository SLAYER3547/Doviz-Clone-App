class FuelSellerList {
  late String fuelSellerImage;
  late String fuelSellerName;
  late double gasolinePrice;
  late double dieselPrice;
  late double lpgPrice;
  FuelSellerList(this.fuelSellerImage, this.fuelSellerName, this.gasolinePrice,
      this.dieselPrice, this.lpgPrice);

  static List<FuelSellerList> fuelSellerList = [
    FuelSellerList(
        "https://upload.wikimedia.org/wikipedia/tr/archive/e/ed/20171112171502%21Petrol_Ofisi_Logosu.png",
        "Petrol Ofisi",
        42.89,
        42.77,
        25.13),
    FuelSellerList(
        "https://mercanlarltd.com.tr/wp-content/uploads/2021/02/Opet-Logo.png",
        "Opet",
        42.86,
        42.76,
        25.08),
    FuelSellerList(
        "https://w7.pngwing.com/pngs/481/1016/png-transparent-shell-logo-royal-dutch-shell-logo-company-business-shell-miscellaneous-company-service.png",
        "Shell",
        42.88,
        42.76,
        26.59),
    FuelSellerList(
        "https://www.tppd.com.tr/Content/piclib/bigsize/icerikler/28/tp-logo-63110-7044571.png",
        "Türkiye Petrolleri",
        42.86,
        42.75,
        25.35),
    FuelSellerList(
        "https://seeklogo.com/images/B/british-petroleum-logo-9E8328A716-seeklogo.com.png",
        "BP",
        42.87,
        42.76,
        25.95),
    FuelSellerList(
        "https://www.aytemiz.com.tr/images/default-source/logolar/aytemiz-logo.png?sfvrsn=fbecc72e_2",
        "Aytemiz",
        42.86,
        42.74,
        24.56),
    FuelSellerList("https://logowik.com/content/uploads/images/787_total.jpg",
        "Total", 42.88, 42.77, 25.36),
    FuelSellerList(
        "https://media.licdn.com/dms/image/v2/C4E0BAQHCHovpewOFkA/company-logo_200_200/company-logo_200_200/0/1631352771562?e=2147483647&v=beta&t=wlz6ylgTT7Y1Hgn_TH2ylBdh-FiFT7ps3S2svFUNDbc",
        "Kadoil",
        42.85,
        42.76,
        25.31),
    FuelSellerList(
        "https://w7.pngwing.com/pngs/863/595/png-transparent-lukoil-logo-petroleum-company-system-total-miscellaneous-text-rectangle-thumbnail.png",
        "Lukoil",
        42.70,
        42.72,
        25.38),
    FuelSellerList(
        "https://kurumsal.aygaz.com.tr/uploads/kurumsal/logo/thumb/cb857f39_f621_4f4d_a951_3cff8e528a43__aygaz.png",
        "Aygaz",
        42.15,
        42.23,
        25.14),
    FuelSellerList(
        "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/96/05/21/9605213d-fe04-6602-31b5-c297cbf18776/app_icon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/512x512bb.jpg",
        "Milangaz",
        42.75,
        42.50,
        25.39),
    FuelSellerList(
        "https://i1.wp.com/letsbecool.com/wp-content/uploads/2021/11/ipragaz-logo.png?fit=300%2C300&ssl=1",
        "İpragaz",
        42.15,
        42.25,
        25.42),
    FuelSellerList(
        "https://www.toptanakaryakit.com.tr/cdn/calsunpet_1640952817.png",
        "Sunpet",
        42.86,
        42.76,
        25.12),
    FuelSellerList(
        "https://www.alpet.com.tr/PageGalleryFiles/PageImages/041106cc-af35-472c-83b4-a8e0bfcba34d.png",
        "Alpet",
        42.86,
        42.75,
        25.08),
    FuelSellerList(
        "https://upload.wikimedia.org/wikipedia/tr/archive/9/9d/20200221210206%21Bpet_logosu.jpg",
        "Bpet",
        42.85,
        42.80,
        24.16)
  ];
}
