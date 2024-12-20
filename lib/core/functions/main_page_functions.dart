import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_bloc.dart';
import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_event.dart';
import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_state.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showPriceFilterBottomSheet(
  BuildContext context,
  String title,
  List<String> itemList,
  String selectedItem,
  Function(String) onSelected, {
  bool showIcons = false,
}) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: const Color(0xFF1a202c),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: showIcons
                      ? Icon(
                          updateOrderIcon(
                            itemList[index],
                          ), // Only show icon for sorting menu
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

void showPreferredCurrencyListsBottomSheet(
  BuildContext context,
  List<String> itemList,
) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: const Color(0xFF1a202c),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Listeler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<ListsBloc, ListsState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    final isVisible = state.visibleLists[index];
                    return ListTile(
                      title: Text(
                        itemList[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          isVisible ? Icons.star : Icons.star_border,
                          color: starIconColor,
                        ),
                        onPressed: () {
                          context
                              .read<ListsBloc>()
                              .add(ToggleListVisibilityEvent(listIndex: index));
                        },
                      ),
                    );
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
