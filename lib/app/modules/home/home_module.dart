import 'package:flutter_modular/flutter_modular.dart';
import 'package:portfolio/app/modules/home/domain/repositories/i_home_repository.dart';
import 'package:portfolio/app/modules/home/domain/usecases/get_home_usecase.dart';
import 'package:portfolio/app/modules/home/external/datasources/home_datasource.dart';
import 'package:portfolio/app/modules/home/infra/datasources/i_home_datasource.dart';
import 'package:portfolio/app/modules/home/infra/repositories/home_repository.dart';

import 'presentation/home_controller.dart';
import 'presentation/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IHomeDatasource>(
      (i) => HomeDatasource(firestore: i.get()),
    ),
    Bind.lazySingleton<IHomeRepository>(
      (i) => HomeRepository(datasource: i.get()),
    ),
    Bind.lazySingleton(
      (i) => GetHomeUsecase(repository: i.get()),
    ),
    Bind.lazySingleton<HomeController>(
      (i) => HomeController(getHomeUsecase: i.get()),
      onDispose: (value) => value.dispose(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
