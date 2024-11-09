import 'package:doviz_clone_app/core/bloc/notification_settings_bloc/notification_bloc.dart';
import 'package:doviz_clone_app/core/utils/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettingsView extends StatelessWidget {
   NotificationSettingsView({super.key});

    final List<String> subCheckboxTexts = [
    'Gündem',
    'Borsa',
    'Döviz',
    'Altın',
    'Emtia',
    'Kripto Para',
  ];
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
            'Bildirim Ayarları',
            style: TextStyle(color: defaultTextColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<CheckboxBloc, CheckboxState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Otomatik Fiyat Bildirimleri',
                          style: TextStyle(
                              color: defaultTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,),
                        ),
                        Checkbox(
                          checkColor: Colors.black,
                          activeColor: systemBlueColor,
                          value: state.autoPriceNotificationsCheckbox,
                          onChanged: (isChecked) {
                            BlocProvider.of<CheckboxBloc>(context).add(
                                ToggleAutoPriceNotificationCheckbox(
                                    isChecked!,),);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 10 * 7.5,
                        child: const Text(
                          'Takip listendeki varlıkların ani fiyat değişimlerine dair bildirimler. Bu bildirimler özel fiyat alarmlarından ayrı çalışır.',
                          style:
                              TextStyle(color: systemGreyColor, fontSize: 16),
                        ),),
                    const SizedBox(height: 20),

                    // İkinci Checkbox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Alarm Bildirimleri',
                          style: TextStyle(
                            color: defaultTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Checkbox(
                          activeColor: systemBlueColor,
                          checkColor: Colors.black,
                          value: state.alarmNotificationsCheckbox,
                          onChanged: (isChecked) {
                            BlocProvider.of<CheckboxBloc>(context).add(
                                ToggleAlarmNotificationsCheckBox(isChecked!),);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10 * 7.5,
                      child: const Text(
                          'Aktif alarmlarınızın belirlediğiniz değere ulaştığında gönderilen bildirimler.',
                          style:
                              TextStyle(color: systemGreyColor, fontSize: 16),),
                    ),
                    const SizedBox(height: 20),

                    // Üçüncü Checkbox ve Altında Altı Ek Checkbox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Haber ve Analiz Bildirimleri',
                          style: TextStyle(
                              color: defaultTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,),
                        ),
                        Checkbox(
                          activeColor: systemBlueColor,
                          checkColor: Colors.black,
                          value: state.newsAndAnalyzeNotificationsCheckbox,
                          onChanged: (isChecked) {
                            BlocProvider.of<CheckboxBloc>(context).add(
                                ToggleNewsAndAnalyzeNotificationsCheckbox(
                                    isChecked!,),);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Altı Alt Checkbox
                    if (state.newsAndAnalyzeNotificationsCheckbox)
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: List.generate(6, (index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(subCheckboxTexts[index],style: const TextStyle(color: defaultTextColor,fontSize: 16),),
                                Checkbox(
                                  checkColor: Colors.black,
                                  activeColor: systemBlueColor,
                                  value: state
                                          .subCheckboxesOfNewsAndAnalyzeNotifications[
                                      index],
                                  onChanged: (isChecked) {
                                    BlocProvider.of<CheckboxBloc>(context).add(
                                        ToggleSubCheckboxesOfNewsAndAnalyzeNotifications(
                                            index, isChecked!,),);
                                  },
                                ),
                                
                              ],
                            );
                          }),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),);
  }
}
