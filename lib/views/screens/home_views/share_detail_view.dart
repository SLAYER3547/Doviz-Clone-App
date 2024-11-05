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

  /// The logo URL of the share.
  final String shareLogo;

  /// The symbol name of the share.
  final String shareSymbolName;

  /// The full name of the share.
  final String shareName;

  /// The current price of the share.
  final double price;

  /// The value change of the share.
  final double changedValue;

  /// The percentage change of the share.
  final double changedValuePercentage;

  /// The lowest value of the day.
  final double lowValueOfDay;

  /// The highest value of the day.
  final double highValueOfDay;

  /// The weekly percentage change.
  final double changedPercentageOfWeek;

  /// The monthly percentage change.
  final double changedPercentageOfMonth;

  /// The yearly percentage change.
  final double changedPercentageOfYear;

  /// The peak value of the share.
  final double peakValue;

  /// The base value of the share.
  final double baseValue;

  /// The total fund size in TL.
  final double fundSizeTl;

  /// The total fund size in lots.
  final double fundSizeLot;

  /// The capital receipts.
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
          ),
        ),
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
                  color: const Color(0xFF1a202c),
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                                color: Colors.white,
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
                      borderColor: Colors.red,
                      color: Colors.white,
                    ),
                    tooltipSettings: const InteractiveTooltip(
                      format: 'point.y',
                      borderColor: Colors.red,
                      borderWidth: 2,
                      textStyle: TextStyle(color: Colors.white),
                      color: Colors.red,
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
                      borderColor: Colors.red,
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
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Haftalık Değişim Oranı',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Aylık Değişim Oranı',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Yıllık Değişim Oranı',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Tavan',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Taban',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Hacim (Tl)',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Hacim (Lot)',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Ödenmiş Sermaye',
                          style: TextStyle(color: Colors.white),
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
                          style: const TextStyle(color: Colors.white),
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
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          '₺${widget.baseValue}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          '₺${widget.fundSizeTl}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          widget.fundSizeLot.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          '₺${widget.capitalReceipts}',
                          style: const TextStyle(color: Colors.white),
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
