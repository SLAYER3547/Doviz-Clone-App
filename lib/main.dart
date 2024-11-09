import 'package:doviz_clone_app/core/bloc/currency_list_bloc/confidentiality_agreement_bloc/agreement_bloc.dart';
import 'package:doviz_clone_app/core/bloc/currency_list_bloc/currency_list_cubit.dart';
import 'package:doviz_clone_app/core/bloc/notification_settings_bloc/notification_bloc.dart';
import 'package:doviz_clone_app/core/utils/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainRoot());
}

class MainRoot extends StatelessWidget {
  const MainRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>AgeConsentBloc()),
        BlocProvider(create: (_)=>CurrencyListCubit()),
        BlocProvider(create: (_)=>CheckboxBloc())
      ,],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
