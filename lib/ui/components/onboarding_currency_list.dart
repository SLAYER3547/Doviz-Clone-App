import 'package:flutter/material.dart';

class CurrencyListContainer extends StatelessWidget {
  const CurrencyListContainer({
    required this.currencyImage,
    required this.currencySymbolName,
    required this.currencyName,
    required this.isFavourited,
    super.key,
  });
  final String currencyImage;
  final String currencySymbolName;
  final String currencyName;
  final bool isFavourited;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    currencyImage,
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currencySymbolName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      currencyName,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isFavourited)
            const Icon(
              Icons.star,
              color: Color(0xFFa36b1b),
            )
          else
            const Icon(Icons.star_border, color: Color(0xFFa36b1b)),
        ],
      ),
    );
  }
}
