import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/core/app_colors.dart';
import 'package:portfolio/app/shared/utils/constants_and_keys.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(navigatorKey);

    return MaterialApp.router(
      title: 'Dáwid Oliveira - Portfólio',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
