import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class EconomicCalendarView extends StatelessWidget {
  const EconomicCalendarView({super.key});

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
            ),),
        title: const Text(
          'Ekonomik Takvim',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: const Center(
        child: Text(
          'Ekonomik Takvim',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
    );
  }
}
