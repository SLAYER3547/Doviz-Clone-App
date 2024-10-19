import 'package:flutter/material.dart';

void showPriceFilterBottomSheet(BuildContext context, String title,
    List<String> itemList, String selectedItem, Function(String) onSelected,
    {bool showIcons = false}) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: const Color(0xFF1a202c),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: showIcons
                      ? Icon(
                          updateOrderIcon(itemList[
                              index]), // Only show icon for sorting menu
                          color: Colors.white,
                        )
                      : null,
                  title: Text(
                    itemList[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: selectedItem == itemList[index]
                      ? const Icon(Icons.check, color: Colors.white)
                      : null,
                  onTap: () {
                    onSelected(itemList[index]);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

String getOrderText(String selectedOrderFilter) {
  if (selectedOrderFilter.contains('Alfabetik')) {
    return 'Alfabetik';
  } else if (selectedOrderFilter.contains('Değişim Oranına')) {
    return 'Değişim';
  }
  return selectedOrderFilter;
}

IconData updateOrderIcon(String selectedOrderFilter) {
  if (selectedOrderFilter == 'Alfabetik (A-Z)') {
    return Icons.arrow_upward;
  } else if (selectedOrderFilter == 'Alfabetik (Z-A)') {
    return Icons.arrow_downward;
  } else if (selectedOrderFilter == 'Değişim Oranına Göre Artan') {
    return Icons.trending_up;
  } else if (selectedOrderFilter == 'Değişim Oranına Göre Azalan') {
    return Icons.trending_down;
  } else if (selectedOrderFilter == 'Değere Göre Artan') {
    return Icons.arrow_upward;
  } else if (selectedOrderFilter == 'Değere Göre Azalan') {
    return Icons.arrow_downward;
  } else {
    return Icons.sort;
  }
}
