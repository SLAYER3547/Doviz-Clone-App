import 'package:flutter/material.dart';

class EconomicCalendarView extends StatelessWidget {
  const EconomicCalendarView({super.key});

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
            ),),
        title: const Text(
          'Ekonomik Takvim',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          'Ekonomik Takvim',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
