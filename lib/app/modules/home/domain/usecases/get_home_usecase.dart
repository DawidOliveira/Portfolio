import 'package:dartz/dartz.dart';
import 'package:portfolio/app/core/failures.dart';
import 'package:portfolio/app/modules/home/domain/entities/home_entity.dart';
import 'package:portfolio/app/modules/home/domain/repositories/i_home_repository.dart';

class GetHomeUsecase {
  final IHomeRepository _repository;

  GetHomeUsecase({required IHomeRepository repository})
      : _repository = repository;

  Future<Either<Failure, HomeEntity>> call() async {
    return _repository.getHome();
  }
}
