import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/core/initializer.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

Future<void> main() async {
  await Initializer.init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
