import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';

class ConfidentialityAgreementView extends StatelessWidget {
  const ConfidentialityAgreementView({super.key});

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
          'Gizlilik Sözleşmesi',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
      body: const Center(
        child: Text(
          'Gizlilik Sözleşmesi',
          style: TextStyle(color: defaultTextColor),
        ),
      ),
    );
  }
}
