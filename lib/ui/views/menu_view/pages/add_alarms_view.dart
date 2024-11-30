import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class AddAlarmsView extends StatelessWidget {
  const AddAlarmsView({super.key});

  @override
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldAndAppBarBackgroundColor, // Arka plan siyah
      appBar: AppBar(
        backgroundColor: scaffoldAndAppBarBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: iconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Alarmlar',
          style: TextStyle(color: defaultTextColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: iconColor),
            onPressed: () {
              // Düzenleme işlemi
            },
          ),
          IconButton(
            icon: const Icon(Icons.add, color: iconColor),
            onPressed: () {
              // Yeni alarm ekleme işlemi
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildAlarmCard(
            context,
            title: 'BIST 30',
            value: '10.083,4045',
            date: '30 Kasım 2024 09:55 tarihinde eklendi.',
            isEnabled: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAlarmCard(
    BuildContext context, {
    required String title,
    required String value,
    required String date,
    required bool isEnabled,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Kartın koyu arka plan rengi
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyan, // Logo arka plan rengi
                ),
                child: const Icon(
                  Icons.show_chart,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) {
              // Alarm durumu değiştirilebilir
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
