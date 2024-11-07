import 'package:doviz_clone_app/core/bloc/currency_list_bloc/currency_list_cubit.dart';
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
    return BlocProvider(
      create: (_) => CurrencyListCubit(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
