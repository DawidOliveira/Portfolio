import 'package:flutter/material.dart';
import 'package:portfolio/app/shared/utils/constants_and_keys.dart';

bool get isMobile {
  return MediaQuery.of(navigatorKey.currentContext!).size.width < 600;
}
