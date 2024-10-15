import 'package:doviz_clone_app/views/menu_view/other_pages/communications_view.dart';
import 'package:doviz_clone_app/views/menu_view/other_pages/confidentiality_agreement_view.dart';
import 'package:doviz_clone_app/views/menu_view/other_pages/disclaimer_view.dart';
import 'package:doviz_clone_app/views/menu_view/other_pages/updates_view.dart';
import 'package:flutter/material.dart';

class OtherMenuPagesList {
  late String pageName;
  late Widget targetPage;

  OtherMenuPagesList(this.pageName,this.targetPage);

  static List<OtherMenuPagesList> otherMenuPagesList = [
    OtherMenuPagesList("Yenilikler",const UpdatesView()),
    OtherMenuPagesList("Yasal Uyarı",const DisclaimerView()),
    OtherMenuPagesList("Gizlilik Sözleşmesi",const ConfidentialityAgreementView()),
    OtherMenuPagesList("İletişim",const CommunicationsView()),
  ];
}
