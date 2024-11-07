import 'package:doviz_clone_app/ui/views/menu_view/other_pages/communications_view/communications_view.dart';
import 'package:doviz_clone_app/ui/views/menu_view/other_pages/confidentiality_agreement_view.dart';
import 'package:doviz_clone_app/ui/views/menu_view/other_pages/disclaimer_view.dart';
import 'package:doviz_clone_app/ui/views/menu_view/other_pages/updates_view.dart';
import 'package:flutter/material.dart';

class OtherMenuPagesList {
  OtherMenuPagesList(this.pageName, this.targetPage);
  late String pageName;
  late Widget targetPage;

  static List<OtherMenuPagesList> otherMenuPagesList = [
    OtherMenuPagesList('Yenilikler', const UpdatesView()),
    OtherMenuPagesList('Yasal Uyarı', const DisclaimerView()),
    OtherMenuPagesList(
        'Gizlilik Sözleşmesi', const ConfidentialityAgreementView(),),
    OtherMenuPagesList('İletişim', const CommunicationsView()),
  ];
}
