import 'package:doviz_clone_app/common/constants/cities_and_districts.dart';
import 'package:doviz_clone_app/core/models/fuel_model/fuel_seller_model.dart';
import 'package:doviz_clone_app/core/models/news_model/news.model.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:doviz_clone_app/ui/views/menu_view/pages/fuel_views/all_fuel_news.dart';
import 'package:doviz_clone_app/ui/views/screens/news_view/news_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FuelsView extends StatefulWidget {
  const FuelsView({super.key});

  @override
  State<FuelsView> createState() => _FuelsViewState();
}

class _FuelsViewState extends State<FuelsView> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  final GlobalKey _categoryKey = GlobalKey();

  List<String> categories = [
    'Benzin',
    'Motorin',
    'LPG',
  ];

  List<FuelSellerList> fuelSellerList = FuelSellerList.fuelSellerList;

  List<_FuelValueGraphicData> data = [
    _FuelValueGraphicData('17 Eki', 44.7),
    _FuelValueGraphicData('18 Eki', 44.7),
    _FuelValueGraphicData('19 Eki', 44.7),
    _FuelValueGraphicData('20 Eki', 44.7),
    _FuelValueGraphicData('21 Eki', 44.7),
    _FuelValueGraphicData('22 Eki', 42.8),
    _FuelValueGraphicData('23 Eki', 42.8),
    _FuelValueGraphicData('24 Eki', 42.8),
  ];

  String selectedRange = '1H';

  // Şehir ve İlçeler için değişkenler
  String selectedCity = 'İstanbul Avrupa';
  String selectedDistrict = 'Fatih';
  final citiesAndDistricts = citiesAndDistrictsMap;

  String todaysDate = DateFormat('dd.MM.yyyy').format(DateTime.now());

  List<News> newsList = News.newsList;
  List<News> fuelNews =
      News.newsList.where((news) => news.category == 'Emtia').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 25),
            const Text(
              'Akaryakıt',
              style: TextStyle(color: defaultTextColor),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildCategoryMenu(),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: PageView.builder(
                controller: _pageController,
                itemCount: categories.length,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                  scrollToCategory(index);
                },
                itemBuilder: (context, index) {
                  return buildFuelGraphic(index);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildCityAndDistrictComboBoxes(),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: const Text(
                    'Dağıtıcı',
                    style: TextStyle(
                      color: defaultTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      fuelSellerList[index].fuelSellerImage,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    fuelSellerList[index].fuelSellerName,
                                    style: const TextStyle(
                                      color: defaultTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    todaysDate,
                                    style: const TextStyle(
                                      color: systemGreyColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width /
                                    10 *
                                    2.45,
                                decoration: BoxDecoration(
                                  color: fuelBackGroundColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          0.3,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: fuelIndicatorColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Benzin',
                                          style: TextStyle(
                                            color: Color(0xFFc9d3db),
                                          ),
                                        ),
                                        Text(
                                          '₺${fuelSellerList[index].gasolinePrice}',
                                          style: const TextStyle(
                                            color: defaultTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width /
                                    10 *
                                    2.45,
                                decoration: BoxDecoration(
                                  color: dieselBackgroundColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          0.3,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFaf4780), // Mor renk
                                            Color(0xFF405db0), // Mavi renk
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Motorin',
                                          style: TextStyle(
                                            color: Color(0xFFc9d3db),
                                          ),
                                        ),
                                        Text(
                                          '₺${fuelSellerList[index].dieselPrice}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width /
                                    10 *
                                    3.5,
                                decoration: BoxDecoration(
                                  color: lpgBackgroundColor,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          0.3,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        color: lpgIndicatorColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(7),
                                          bottomLeft: Radius.circular(7),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'LPG (Otogaz)',
                                          style: TextStyle(
                                            color: Color(0xFFc9d3db),
                                          ),
                                          maxLines: 2,
                                        ),
                                        Text(
                                          '₺${fuelSellerList[index].lpgPrice}',
                                          style: const TextStyle(
                                            color: defaultTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              childCount: fuelSellerList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllFuelNews(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      'Akaryakıt Fiyatları Haberleri',
                      style: TextStyle(
                        color: defaultTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: defaultTextColor,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailPage(
                                newsList: fuelNews, // Pass all news
                                initialIndex: index, // Pass the selected index
                                selectedCategory:
                                    'Emtia', // Pass the category of the selected news
                              ),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 10 * 3.1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  fuelNews[index].imageUrl,
                                  width: 120,
                                  height: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fuelNews[index].category.toUpperCase(),
                                  style: const TextStyle(
                                    color: Color(0xFF86909b),
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      10 *
                                      5.5,
                                  child: Text(
                                    fuelNews[index].title,
                                    style: const TextStyle(
                                      color: defaultTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${fuelNews[index].date} ${fuelNews[index].time}',
                                  style: const TextStyle(
                                    color: Color(0xFFcaccd1),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryMenu() {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
                _pageController.jumpToPage(selectedIndex);
              });
              scrollToCategory(index);
            },
            child: Column(
              children: [
                Padding(
                  key: selectedIndex == index ? _categoryKey : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color:
                          selectedIndex == index ? defaultTextColor : systemGreyColor,
                      fontWeight: selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (selectedIndex == index)
                  Container(
                    height: 2,
                    width: 110,
                    color: defaultTextColor,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void scrollToCategory(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final categoryBox =
          _categoryKey.currentContext?.findRenderObject() as RenderBox?;
      if (categoryBox != null) {
        final categoryPosition = categoryBox.localToGlobal(Offset.zero).dx;
        final screenWidth = MediaQuery.of(context).size.width;

        final scrollPosition =
            categoryPosition - (screenWidth / 2) + (categoryBox.size.width / 2);
        _scrollController.animateTo(
          scrollPosition.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Widget buildFuelGraphic(int categoryIndex) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: ['1H', '1A', '3A', '6A', '1Y', '5Y', 'Tümü'].map((range) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRange = range;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: selectedRange == range
                        ? const Color(0xFF0c66c6)
                        : Colors.black,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    range,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 250,
          child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              axisLine: AxisLine(width: 0),
              labelStyle: TextStyle(color: Color(0xFF3a3a3a)),
            ),
            primaryYAxis: const NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              majorTickLines: MajorTickLines(width: 0),
              axisLine: AxisLine(width: 0),
              labelStyle: TextStyle(color: Color(0xFF3a3a3a)),
            ),
            plotAreaBorderWidth: 0,
            tooltipBehavior: TooltipBehavior(enable: true),
            trackballBehavior: TrackballBehavior(
              enable: true,
              activationMode: ActivationMode.singleTap,
              markerSettings: const TrackballMarkerSettings(
                markerVisibility: TrackballVisibilityMode.visible,
                width: 10,
                height: 10,
                borderWidth: 3,
                borderColor: errorColor,
                color: Colors.white,
              ),
              tooltipSettings: const InteractiveTooltip(
                format: 'point.y',
                borderColor: errorColor,
                borderWidth: 2,
                textStyle: TextStyle(color: Colors.white),
                color: errorColor,
              ),
            ),
            series: <CartesianSeries<_FuelValueGraphicData, String>>[
              AreaSeries<_FuelValueGraphicData, String>(
                dataSource: data,
                xValueMapper: (_FuelValueGraphicData sales, _) => sales.day,
                yValueMapper: (_FuelValueGraphicData sales, _) =>
                    sales.cryptoValue,
                name: 'Value',
                color: const Color(0xFF1e0e11),
                borderColor: errorColor,
                borderWidth: 3,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCityAndDistrictComboBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildCityComboBox(),
        const SizedBox(height: 10),
        buildDistrictComboBox(),
      ],
    );
  }

  Widget buildCityComboBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: DropdownButton<String>(
        value: selectedCity,
        dropdownColor: Colors.black,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        style: const TextStyle(color: Colors.white),
        isExpanded: true,
        underline: const SizedBox(),
        items: citiesAndDistricts.keys
            .map<DropdownMenuItem<String>>((String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCity = newValue!;
            selectedDistrict = citiesAndDistricts[selectedCity]!.first;
          });
        },
      ),
    );
  }

  Widget buildDistrictComboBox() {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: DropdownButton<String>(
        value: selectedDistrict,
        dropdownColor: Colors.black,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        style: const TextStyle(color: Colors.white),
        isExpanded: true,
        underline: const SizedBox(),
        items: citiesAndDistricts[selectedCity]!
            .map<DropdownMenuItem<String>>((String district) {
          return DropdownMenuItem<String>(
            value: district,
            child: Text(district),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedDistrict = newValue!;
          });
        },
      ),
    );
  }
}

class _FuelValueGraphicData {
  _FuelValueGraphicData(this.day, this.cryptoValue);
  final String day;
  final double cryptoValue;
}
