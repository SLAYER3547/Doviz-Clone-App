import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

const Color selectedBorderColor = Colors.blue;

class AppThemeSettingView extends StatefulWidget {
  const AppThemeSettingView({super.key});

  @override
  State<AppThemeSettingView> createState() => _AppThemeSettingViewState();
}

class _AppThemeSettingViewState extends State<AppThemeSettingView> {
  String _selectedTheme = 'Koyu'; // Varsayılan tema
  bool _showLogos = true; // Logoları göster durumu

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
          ),
        ),
        title: const Text(
          'Görünüm Ayarları',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tema seçenekleri
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildThemeOption(
                  context,
                  'Açık',
                  'assets/images/light_theme.png',
                ),
                _buildThemeOption(
                  context,
                  'Koyu',
                  'assets/images/dark_theme.png',
                ),
                _buildThemeOption(
                  context,
                  'Sistem',
                  'assets/images/system_theme.png',
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Ayarlar
            const Text(
              'Sembol',
              style: TextStyle(
                color: defaultTextColor,
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Logoları göster',
                  style: TextStyle(color: defaultTextColor, fontSize: 16),
                ),
                Switch(
                  value: _showLogos,
                  onChanged: (bool value) {
                    setState(() {
                      _showLogos = value;
                    });
                  },
                  activeColor: selectedBorderColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(BuildContext context, String title, String imagePath) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(
              color: _selectedTheme == title ? selectedBorderColor : systemGreyColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: [
            Radio<String>(
              value: title,
              groupValue: _selectedTheme,
              onChanged: (String? value) {
                setState(() {
                  _selectedTheme = value!;
                });
              },
              activeColor: Colors.white, // Radio butonunun iç yuvarlağı beyaz
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return selectedBorderColor; // Dış çerçeve seçildiğinde mavi
                }
                return systemGreyColor; // Varsayılan renk
              }),
            ),
            Text(
              title,
              style: TextStyle(
                color: _selectedTheme == title ? selectedBorderColor : defaultTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
