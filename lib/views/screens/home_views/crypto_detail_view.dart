import 'package:flutter/material.dart';

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
      body: Center(
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
            
          ],
        ),
      ),
    );
  }
}
