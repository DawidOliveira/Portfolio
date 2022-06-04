import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppResponsive {
  AppResponsive._();

  static bool get isMobile =>
      MediaQuery.of(Modular.routerDelegate.navigatorKey.currentContext!)
          .size
          .width <
      960;
}
