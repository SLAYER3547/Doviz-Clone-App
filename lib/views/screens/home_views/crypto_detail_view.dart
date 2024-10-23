import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoDetailView extends StatefulWidget {
  final String cryptoImage;
  final String cryptoSymbolName;
  final String cryptoName;
  final double cryptoPrice;
  final double cryptoValueForTl;
  final double changePercentageOfWeek;
  final double changePercentageOfMonth;
  final double changePercentageOfYear;
  final double fundSize;
  final double maximumValueOf52Week;
  final double marketValue;
  final double changedPercentage;
  final double changedValue;

  const CryptoDetailView({
    super.key,
    required this.cryptoImage,
    required this.cryptoSymbolName,
    required this.cryptoName,
    required this.cryptoPrice,
    required this.cryptoValueForTl,
    required this.changePercentageOfWeek,
    required this.changePercentageOfMonth,
    required this.changePercentageOfYear,
    required this.fundSize,
    required this.maximumValueOf52Week,
    required this.marketValue,
    required this.changedPercentage,
    required this.changedValue,
  });

  @override
  State<CryptoDetailView> createState() => _CryptoDetailViewState();
}

class _CryptoDetailViewState extends State<CryptoDetailView> {
  List<_CryptoValueGraphicData> data = [
    _CryptoValueGraphicData('07.54', 0.08),
    _CryptoValueGraphicData('12.03', 0.11),
    _CryptoValueGraphicData('16.14', 0.14),
    _CryptoValueGraphicData('20.30', 0.16),
    _CryptoValueGraphicData('01.12', 0.18),
    _CryptoValueGraphicData('05.32', 0.18),
  ];
  String selectedRange = "1G";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 22,
            )),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.star,
            color: Color(0xFFfe9e12),
            size: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 10 * 9,
                decoration: BoxDecoration(
                    color: const Color(0xFF1a202c),
                    borderRadius: BorderRadius.circular(7)),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10 * 8,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              widget.cryptoImage,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "${widget.cryptoSymbolName.toUpperCase()} - ${widget.cryptoName.toUpperCase()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Son (07:43)",
                              style: TextStyle(color: Color(0xFFa5b1bf)),
                            ),
                            Text(
                              "\$${widget.cryptoPrice}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  "%${widget.changedPercentage.toString()} ",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "(\$${widget.changedValue})",
                                  style:
                                      const TextStyle(color: Color(0xFFa5b1bf)),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "${widget.cryptoSymbolName}/TRY",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 228, 233, 240)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "₺${widget.cryptoValueForTl}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      ["1G", "1W", "1M", "3M", "6M", "1Y", "Tümü"].map((range) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRange = range;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
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
              const SizedBox(
                height: 20,
              ),
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
                    borderWidth: 0,
                    axisLine: AxisLine(width: 0),
                    labelStyle: TextStyle(color: Color(0xFF3a3a3a)),
                  ),
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: TooltipBehavior(enable: true),
                  trackballBehavior: TrackballBehavior(
                    enable: true,
                    lineType: TrackballLineType.vertical, 
                    activationMode: ActivationMode.singleTap, 
                    markerSettings: const TrackballMarkerSettings(
                      markerVisibility: TrackballVisibilityMode
                          .visible, 
                      shape: DataMarkerType.circle,
                      width: 10,
                      height: 10,
                      borderWidth: 2,
                      borderColor: Colors.green,
                      color: Colors.white,
                    ),
                    tooltipSettings: const InteractiveTooltip(
                      enable: true,
                      format: 'point.y', 
                      borderColor: Colors.green,
                      borderWidth: 2,
                      textStyle: TextStyle(color: Colors.white),
                      color: Colors.green,
                    ),
                  ),
                  series: <CartesianSeries<_CryptoValueGraphicData, String>>[
                    AreaSeries<_CryptoValueGraphicData, String>(
                      dataSource: data,
                      xValueMapper: (_CryptoValueGraphicData sales, _) =>
                          sales.time,
                      yValueMapper: (_CryptoValueGraphicData sales, _) =>
                          sales.cryptoValue,
                      name: 'Value',
                      color:
                          const Color(0xFF0B2315),
                      borderColor: Colors.green,
                      borderWidth: 2,
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: false),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Haftalık Değişim Oranı",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Aylık Değişim Oranı",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Yıllık Değişim Oranı",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${widget.cryptoSymbolName.toString()}/TRY",
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Hacim",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "52 Haftanın En Yüksek Değeri",
                          style: TextStyle(color: Colors.white),
                        ),
                        const Text(
                          "Piyasa Değeri",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(width: 25,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "%${widget.changePercentageOfWeek.toString()}",
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          "%${widget.changePercentageOfMonth.toString()}",
                          style: const TextStyle(color: Colors.orange),
                        ),
                        Text(
                          "%${widget.changePercentageOfYear.toString()}",
                          style: const TextStyle(color: Colors.orange),
                        ),
                        Text(
                          "₺${widget.cryptoValueForTl.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\$${widget.fundSize.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\$${widget.maximumValueOf52Week.toString()}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          "\$${widget.marketValue.toString()}",
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CryptoValueGraphicData {
  _CryptoValueGraphicData(this.time, this.cryptoValue);

  final String time;
  final double cryptoValue;
}
