import 'package:doviz_clone_app/views/menu_view/pages/add_alarms_view.dart';
import 'package:doviz_clone_app/views/menu_view/pages/articles_view.dart';
import 'package:doviz_clone_app/views/menu_view/pages/calculate_credit_view.dart';
import 'package:doviz_clone_app/views/menu_view/pages/economic_calendar_view.dart';
import 'package:doviz_clone_app/views/menu_view/pages/fuel_views/fuels_view.dart';
import 'package:doviz_clone_app/views/menu_view/pages/ipo_view.dart';
import 'package:doviz_clone_app/views/menu_view/pages/news_feed_view.dart';
import 'package:doviz_clone_app/views/screens/news_view/news.view.dart';
import 'package:flutter/material.dart';

class PageList {
  late IconData pageIcon;
  late String pageName;
  late Widget targetPage;

  PageList(this.pageIcon, this.pageName,this.targetPage);

  static List<PageList> pageList = [
    PageList(Icons.notifications_none, "Alarmlar",const AddAlarmsView()),
    PageList(Icons.oil_barrel_outlined, "Akaryakıt",const FuelsView()),
    PageList(Icons.currency_lira, "Halka Arz",const IpoView()),
    PageList(Icons.newspaper, "Haber Akışı",const NewsFeedView()),
    PageList(Icons.message, "Analizler", const NewsView(appBarTitle: "Analizler",)),
    PageList(Icons.article, "Makaleler",const ArticlesView()),
    PageList(Icons.calculate, "Kredi Hesaplama",const CalculateCreditView()),
    PageList(Icons.calendar_today_outlined, "Ekonomik Takvim",const EconomicCalendarView()),
  ];
}
