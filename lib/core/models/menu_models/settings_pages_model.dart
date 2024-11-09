import 'package:doviz_clone_app/ui/views/menu_view/settings_pages/app_theme_setting_view.dart';
import 'package:doviz_clone_app/ui/views/menu_view/settings_pages/notification_settings_view.dart';
import 'package:doviz_clone_app/ui/views/menu_view/settings_pages/security_settings_view.dart';
import 'package:flutter/material.dart';

class SettingsPagesList {

  SettingsPagesList(this.pageIcon, this.pageName, this.targetPage);
  late IconData pageIcon;
  late String pageName;
  late Widget targetPage;

  static List<SettingsPagesList> settingsPagesList = [
    SettingsPagesList(Icons.wifi, 'Bildirim',  NotificationSettingsView()),
    SettingsPagesList(
        Icons.brush_outlined, 'Görünüm', const AppThemeSettingView(),),
    SettingsPagesList(
        Icons.fingerprint, 'Güvenlik', const SecuritySettingsView(),),
  ];
}
