import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShareDetailView extends StatefulWidget {
  const ShareDetailView({
    required this.shareLogo,
    required this.shareSymbolName,
    required this.shareName,
    required this.price,
    required this.changedValue,
    required this.changedValuePercentage,
    required this.lowValueOfDay,
    required this.highValueOfDay,
    required this.changedPercentageOfWeek,
    required this.changedPercentageOfMonth,
    required this.changedPercentageOfYear,
    required this.peakValue,
    required this.baseValue,
    required this.fundSizeTl,
    required this.fundSizeLot,
    required this.capitalReceipts,
    super.key,
  });

  final String shareLogo;
  final String shareSymbolName;
  final String shareName;
  final double price;
  final double changedValue;
  final double changedValuePercentage;
  final double lowValueOfDay;
  final double highValueOfDay;
  final double changedPercentageOfWeek;
  final double changedPercentageOfMonth;
  final double changedPercentageOfYear;
  final double peakValue;
  final double baseValue;
  final double fundSizeTl;
  final double fundSizeLot;
  final double capitalReceipts;

  @override
  State<ShareDetailView> createState() => _ShareDetailViewState();
}

class _ShareDetailViewState extends State<ShareDetailView> {
  List<_ShareValueGraphicData> data = [
    _ShareValueGraphicData('09.55', 52.5),
    _ShareValueGraphicData('10.00', 51),
    _ShareValueGraphicData('10.02', 52),
  ];
  String selectedRange = '1G';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: iconColor,
            size: 22,
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: iconColor,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.star,
            color: Color(0xFFfe9e12),
            size: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 10 * 9,
                decoration: BoxDecoration(
                  color: systemMainGreyColor,
                  borderRadius: BorderRadius.circular(7),
                ),
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
                              widget.shareLogo,
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
                              '${widget.shareSymbolName.toUpperCase()} - ${widget.shareName.toUpperCase()}',
                              style: const TextStyle(
                                color: defaultTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
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
                              'Son (10.02)',
                              style: TextStyle(color: Color(0xFFa5b1bf)),
                            ),
                            Text(
                              '\$${widget.price}',
                              style: const TextStyle(
                                color: defaultTextColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '%${widget.changedValuePercentage} ',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '(\$${widget.changedValue})',
                                  style:
                                      const TextStyle(color: Color(0xFFa5b1bf)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Günlük Aralık',
                              style: TextStyle(
                                color: Color.fromARGB(255, 228, 233, 240),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              '₺${widget.baseValue} - ${widget.peakValue}',
                              style: const TextStyle(
                                color: defaultTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      ['1G', '1H', '1A', '3A', '6A', '1Y', 'Tümü'].map((range) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRange = range;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: selectedRange == range
                              ? const Color(0xFF0c66c6)
                              : Colors.black,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Text(
                          range,
                          style: const TextStyle(color: defaultTextColor),
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
                  series: <CartesianSeries<_ShareValueGraphicData, String>>[
                    AreaSeries<_ShareValueGraphicData, String>(
                      dataSource: data,
                      xValueMapper: (_ShareValueGraphicData sales, _) =>
                          sales.time,
                      yValueMapper: (_ShareValueGraphicData sales, _) =>
                          sales.shareValue,
                      name: 'Value',
                      color: const Color(0xFF1e0e11),
                      borderColor: errorColor,
                      borderWidth: 3,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Günlük Aralık',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Haftalık Değişim Oranı',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Aylık Değişim Oranı',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Yıllık Değişim Oranı',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Tavan',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Taban',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Hacim (Tl)',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Hacim (Lot)',
                          style: TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          'Ödenmiş Sermaye',
                          style: TextStyle(color: defaultTextColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.baseValue} - ${widget.peakValue}',
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          '%${widget.changedPercentageOfWeek}',
                          style: const TextStyle(color: Colors.green),
                        ),
                        Text(
                          '%${widget.changedPercentageOfMonth}',
                          style: const TextStyle(color: Colors.orange),
                        ),
                        Text(
                          '%${widget.changedPercentageOfYear}',
                          style: const TextStyle(color: Colors.orange),
                        ),
                        Text(
                          '₺${widget.peakValue}',
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          '₺${widget.baseValue}',
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          '₺${widget.fundSizeTl}',
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          widget.fundSizeLot.toString(),
                          style: const TextStyle(color: defaultTextColor),
                        ),
                        Text(
                          '₺${widget.capitalReceipts}',
                          style: const TextStyle(color: defaultTextColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShareValueGraphicData {
  _ShareValueGraphicData(this.time, this.shareValue);

  final String time;
  final double shareValue;
}
