import 'package:dartz/dartz.dart';
import 'package:portfolio/app/core/failures.dart';
import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';

abstract class IHomeRepository {
  Future<Either<Failure, HomeEntity>> getHome();
}
