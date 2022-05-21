import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';

abstract class IHomeDatasource {
  Future<HomeEntity> getHome();
}
